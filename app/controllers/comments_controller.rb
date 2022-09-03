class CommentsController < ApplicationController
  # load_and_authorize_resource
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
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(user_id: params[:user_id], id:params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
