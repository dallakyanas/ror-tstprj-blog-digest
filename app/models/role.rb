class Role < ApplicationRecord
  validates :code, presence: true
end
