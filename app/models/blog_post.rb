class BlogPost < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
end
