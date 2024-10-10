class ContactFormController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # send email notification to site owner
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to flows_path, notice: 'Thank you for your message!'
    else
      render :index
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
