class Public::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to public_post_image_path(@post_image.id)
  end

  def index
  end

  def show
    @post_image = @post_image
  end

  def edit
  end


  private

  def post_image_params
    params.require(:post_image).permit(:image, :title, :body)
  end

end
