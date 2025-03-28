class FlowsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # Ensure the user is logged in
  before_action :set_flow, only: %i[ show edit update destroy ]
  before_action :authorize_user!, only: [:destroy, :edit]

  # GET /flows or /flows.json
  def index
    Rails.logger.info "Received search request with query: #{params[:query]}"
    
    if params[:query].present?
      @flows = Flow.where("title LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @flows = Flow.all
    end

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("flows", partial: "flows", locals: { flows: @flows })
      end
    end
  end

  # GET /flows/1 or /flows/1.json
  def show
    @flow = Flow.friendly.find(params[:id])
  end

  # GET /flows/new
  def new
    @flow = Flow.new
  end

  # GET /flows/1/edit
  def edit
    @flow = Flow.friendly.find(params[:id])
  end

  # POST /flows or /flows.json
  def create
    @flow = current_user.flows.build(flow_params) # Associate flow with current_user

    respond_to do |format|
      if @flow.save
        format.html { redirect_to @flow, notice: "Flow was successfully created." }
        format.json { render :show, status: :created, location: @flow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flows/1 or /flows/1.json
  def update
    respond_to do |format|
      if @flow.update(flow_params)
        format.html { redirect_to @flow, notice: "Flow was successfully updated." }
        format.json { render :show, status: :ok, location: @flow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flows/1 or /flows/1.json
  def destroy
    @flow.destroy!

    respond_to do |format|
      format.html { redirect_to flows_path, status: :see_other, notice: "Flow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flow
      @flow = Flow.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flow_params
      params.require(:flow).permit(:title, :description, :file)
    end

    def authorize_user!
      unless @flow.user == current_user
        redirect_to flows_path, notice: 'You are not authorized to edit or delete this flow.'
      end
    end
end
