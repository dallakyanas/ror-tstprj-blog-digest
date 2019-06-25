class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum subscription_type: [:no, :daily, :weekly]
  belongs_to :role
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  after_create :send_welcome_email
  after_initialize :init


  def init
    self.subscription_type ||= :weekly
    self.role_id ||= Role.where(code: 'RL_VIEWER').first.id
  end


  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_later
  end


  def is_admin?
    # кто первый встал того и сервер =)
    self.id == 1
  end
end
