# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end


  def daily_digest_email
    UserMailer.with(user: User.first).daily_digest_email
  end


  def weekly_digest_email
    UserMailer.with(user: User.first).weekly_digest_email
  end
end
