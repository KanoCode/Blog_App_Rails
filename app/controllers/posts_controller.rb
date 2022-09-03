class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user

  def index
    @posts = Post.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end
   
  def destroy
    @post = Post.find(params[:id])
      @post.destroy
      redirect_to user_posts_path(current_user.id)
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

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
    params.require(:post).permit(:title, :text)
  end
end
