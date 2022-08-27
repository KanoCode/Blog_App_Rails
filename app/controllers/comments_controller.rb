class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(user_id: current_user.id, id: @comment.post.id)
    else
      render :new, alert: 'Error occurred, Post not saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
