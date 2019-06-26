module BlogPostsHelper
  def is_owner(p_blog_post)
    if !current_user
      return false
    else
      return p_blog_post.user_id == current_user.id
    end
  end

end
