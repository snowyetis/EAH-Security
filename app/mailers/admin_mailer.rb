class AdminMailer < ApplicationMailer
  default from: 'eahlocksmithtest216.mailer@gmail.com'

  def new_user_waiting_for_approval(user)
    @user = user
    @url  =  request.original_url + "/admins/signed_up"
    mail(to: "eahlocksmithtest216.mailer@gmail.com", subject: 'A New User has Requested Access')
  end

  def new_user_approved(user)
    @user = user
    @url =  request.original_url + "/users/sign_in"
    mail(to: @user.email, subject: "A Message Regarding your Access to EAH Security")
  end

end
