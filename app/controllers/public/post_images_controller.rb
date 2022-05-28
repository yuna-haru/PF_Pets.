class Public::PostImagesController < ApplicationController
  before_action :current_user
  before_action :login_check, only: [:new, :edit, :update, :destroy]


  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to public_post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def index
    @post_image = PostImage.all
    @users = User.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @users = User.all
    @comment = Comment.new
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

  def keyword
    @users = User.all
    if params[:keyword].present?
      @post_images = PostImage.where('body LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @post_image = PostImage.all
    end
    # redirect_to keyword_public_post_images_path
  end
  
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashtag: params[:])
  end


  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image)
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to public_post_images_path
    end
  end

end
