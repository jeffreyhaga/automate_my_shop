class FlowsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # Ensure the user is logged in
  before_action :set_flow, only: %i[ show edit update destroy ]

  # GET /flows or /flows.json
  def index
    @flows = Flow.all
  end

  # GET /flows/1 or /flows/1.json
  def show
    @flow
  end

  # GET /flows/new
  def new
    @flow = Flow.new
  end

  # GET /flows/1/edit
  def edit
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
      @flow = Flow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flow_params
      params.require(:flow).permit(:title, :description, :file)
    end
end
