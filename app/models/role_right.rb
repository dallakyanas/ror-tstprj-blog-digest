class RoleRight < ApplicationRecord
  belongs_to :role
  belongs_to :action
  validates :role, presence: true
  validates :action, presence: true
end
