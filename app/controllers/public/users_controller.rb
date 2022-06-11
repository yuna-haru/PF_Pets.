class Public::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  def confirm
    @user = current_user
  end

  def withdraw
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to public_user_path(@user.id)
      return
    end
    @user.update(is_deleted: true)
    reset_session
    redirect_to public_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
