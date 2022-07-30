class Admin::UsersController < ApplicationController


  def index
    @user = User.page(params[:page])
  end

  def post_images
   @user =  User.find(params[:id])
   @post_images = @user.post_images
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end


  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :introduction, :is_deleted)
  end

end
