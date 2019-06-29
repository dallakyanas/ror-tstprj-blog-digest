class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
