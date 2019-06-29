module PostCommentsHelper
  def is_owner(p_post_comment)
    if !current_user
      return false
    else
      return p_post_comment.user_id == current_user.id
    end
  end
end
