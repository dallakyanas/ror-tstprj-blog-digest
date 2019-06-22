class Action < ApplicationRecord
  validates :controller_name, presence: true
  validates :action_name, presence: true
end
