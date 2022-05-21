class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.users_id = current_user.id
    @post_image.save
    redirect_to public_post_image_path(@post_image.id)
  end

  def index
    @post_image = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to public_post_image_path(@post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy(post_image_params)
    redirect_to public_post_images_path
  end


  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image)
  end

end
