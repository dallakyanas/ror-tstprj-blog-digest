class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]
  before_action :check_access, only: [:edit, :update, :new, :create, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  include BlogPostsHelper

  # GET /post_comments
  def index
    # TODO: только для текущего поста?
    @post_comments = PostComment.all.order(publish_date: :desc)
  end

  # GET /post_comments/1
  def show
  end

  # GET /post_comments/new
  def new
    @post_comment = PostComment.new
  end

  # GET /post_comments/1/edit
  def edit
  end

  # POST /post_comments
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to @post_comment, notice: 'Комментарий успешно добавлен' }
      else
        format.html { render :new }
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
