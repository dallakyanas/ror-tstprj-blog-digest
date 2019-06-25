class Action < ApplicationRecord
  validates :controller_name, presence: true
  validates :action_name, presence: true
  has_many :role_rights
end
