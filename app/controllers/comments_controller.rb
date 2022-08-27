class CommentsController < ApplicationController

  def new
      @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.new(text: comment_params[:text], user_id: current_user.id, post_id: @post.id) 

    if @comment.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      render :new, alert: 'Error occurred, Post not saved' 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end


end
