class Public::BookmarksController < ApplicationController
  before_action :current_user
  before_action :login_check, only: [:index, :create, :destroy]

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @users = User.all
    #@bookmark = Bookmark.post_image.all
    #@bookmark = Bookmark.user.all #アソシエーションの関係があるのでこれは必要ない
  end

  def create
    @post_image = PostImage.find(params[:post_image_id])
    bookmark = @post_image.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    bookmark = @post_image.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end


  private

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to public_users_path
    end
  end


end
