class Public::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(@user.id)
  end

  def confirm
  end

  def withdraw
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
