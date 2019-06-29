class AddIndexToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_index :post_comments, [:blog_post_id, :created_at]
  end
end
