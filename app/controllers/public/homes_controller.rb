class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.last(4)
  end



  def post_image_params
    params.require(:post_image).permit(:image)
  end


end
