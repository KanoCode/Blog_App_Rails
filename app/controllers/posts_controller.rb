class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_post_path(user_id: @user.id, id: @post.id)
    else
      render :new, alert: 'Error occurred, Post not saved'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
