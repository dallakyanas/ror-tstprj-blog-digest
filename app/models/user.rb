class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum subscription_type: [:no, :daily, :weekly]
  belongs_to :role
  validates :role, presence: true
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
end
