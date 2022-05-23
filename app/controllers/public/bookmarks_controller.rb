class Public::BookmarksController < ApplicationController
  before_action :current_user

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @users = User.all
    #@bookmark = Bookmark.post_image.all
    #@bookmark = Bookmark.user.all
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


end
