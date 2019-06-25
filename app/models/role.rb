class Role < ApplicationRecord
  validates :code, presence: true
  has_many :users
  has_many :role_rights
end
