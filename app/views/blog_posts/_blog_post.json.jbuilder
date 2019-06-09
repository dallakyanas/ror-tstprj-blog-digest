json.extract! blog_post, :id, :title, :content, :publish_date, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)
