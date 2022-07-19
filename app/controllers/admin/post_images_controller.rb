class Admin::PostImagesController < ApplicationController
  before_action :check_admin

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to admin_post_images_path
  end


  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image, :hashbody, hashtag_ids: [])
  end

  def check_admin
    redirect_to root_path
  end

end
