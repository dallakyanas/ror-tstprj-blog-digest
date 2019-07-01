class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:update, :destroy]
  before_action :check_access, only: [:update, :create, :destroy]
  before_action :check_owner, only: [:update, :destroy]

  include BlogPostsHelper

  # POST /post_comments
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])

    @post_comment = @blog_post.post_comments.create(post_comment_params)
    @post_comment.user_id = current_user.id

    respond_to do |format|
      if @post_comment.save
        format.html{ redirect_to request.referrer || root_url}
      else
        format.html{ redirect_to request.referrer || root_url}
      end
    end
  end

  # PATCH/PUT /post_comments/1
  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to @post_comment, notice: 'Комментарий успешно обновлен' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /post_comments/1
  def destroy
    @post_comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_url, notice: 'Комментарий успешно удален' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:content)
    end

    def check_owner
      unless is_owner(@post_comment) || (action_name =='destroy' && current_user.is_superuser)
        flash[:alert] = "Запрещено редактировать чужой контент"
        redirect_to  root_url
      end
    end
end
