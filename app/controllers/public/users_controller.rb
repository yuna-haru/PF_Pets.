class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
  end

  def confirm
  end

  def withdraw
  end
end
