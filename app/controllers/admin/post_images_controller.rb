class Admin::PostImagesController < ApplicationController

  def index
    @post_images = PostImage.all
  end

  def show
  end

  def edit
  end
end
