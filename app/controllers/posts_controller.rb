class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post =Post.new
    @params = params
  end

  def create

    @post = Post.new(title: params[:post][:title],user_id:params[:id], text: params[:post][:body], postsCounter:0, likesCounter:0)
   
    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: @post.user_id)
    else
      render :new, alert: 'Error occurred, Post not saved'
    end
  end



  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.permit(:title,:text,:user_id)
  end
end
