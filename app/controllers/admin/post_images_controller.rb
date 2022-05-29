class Admin::PostImagesController < ApplicationController

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image, :hashbody, hashtag_ids: [])
  end

end
