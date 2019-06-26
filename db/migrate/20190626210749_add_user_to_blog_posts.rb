class AddUserToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :blog_posts, :user, foreign_key: true
  end
end
