class Public::CommentsController < ApplicationController
  before_action :login_check, only: [:create, :destroy]

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.comments.new(comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to public_post_image_path(post_image.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_post_image_path(params[:post_image_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to public_post_images_path
    end
  end

end
