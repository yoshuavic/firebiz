class UserMailer < ApplicationMailer

  default from: "yoshuavic8@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(register)
    @register = register

    mail to: register.email, subject: "Sign in confirmation"
  end
end
