class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :post_comments

  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
end
