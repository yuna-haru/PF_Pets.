class Admin::PostImagesController < ApplicationController

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to admin_post_images_path
  end

  def index_user
    @post_image = PostImage.where(user_id:params[:id])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image, :hashbody, hashtag_ids: [])
  end


end
