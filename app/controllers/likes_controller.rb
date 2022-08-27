class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(like_params) 
    if @like.save
    redirect_to user_post_path(user_id: current_user.id, id: @post.id) 
  end
end


  # def destroy
  #   @like = current_user.likes.find(params[:id])
  #   @like.destroy
  #   redirect_to @post
  # end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
