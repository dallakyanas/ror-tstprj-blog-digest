class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :user
      t.references :blog_post
      t.text :content

      t.timestamps
    end
  end
end
