class UserMailer < ApplicationMailer
  default from: 'info@blog-digest.test'
  layout 'user_mailer'

  def welcome_email
    @user = params[:user]
    make_bootstrap_mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Welcome to Blog-Digest.test',
    )
  end
end
