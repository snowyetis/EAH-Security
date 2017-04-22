class AdminMailer < ApplicationMailer
  default from: 'eahlocksmithtest216.mailer@gmail.com'

  def new_user_waiting_for_approval(user)
    @user = user
    @url  = Rails.application.config.absolute_site_url + "admins/signed_up"
    mail(to: "eahlocksmithtest216.mailer@gmail.com", subject: 'A New User has Requested Access')
  end

  def new_user_approved(email)
    @email = email
    @url =  Rails.application.config.absolute_site_url + "users/sign_in"
    mail(to: @email, subject: "A Message Regarding your Access to EAH Security")
  end

end
