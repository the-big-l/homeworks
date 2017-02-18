class UserMailer < ApplicationMailer
  default from: 'me@leosalat.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://leosalat.com/login'
    mail(to: 'example@leosalat.com', subject: 'Hot Poop in your email')
  end
end
