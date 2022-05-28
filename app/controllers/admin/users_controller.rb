class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :introduction, :is_deleted)
  end
end
