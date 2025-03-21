class ContactFormController < ApplicationController

  before_action :set_contact, only: [:index]

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      flash[:notice] = 'Thank you for your message, we will be in touch shortly.'
      redirect_to flows_path
    else
      render :index
    end
  end

  private

  def set_contact
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
