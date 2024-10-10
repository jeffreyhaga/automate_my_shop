class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: "jeffreyrhaga@gmail.com", subject: "New Contact Form Submission")
  end
end
