class UserMailer < ApplicationMailer
  default from: 'info@blog-digest.test'
  # layout 'mailer'

  def welcome_email
    @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to BlogDigest.test')
  end
end
