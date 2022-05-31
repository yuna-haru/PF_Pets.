class Public::PostImagesController < ApplicationController
  before_action :current_user
  before_action :login_check, only: [:new, :show, :edit, :update, :destroy]


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
    @post_image = PostImage.page(params[:page])
    @user = current_user
  end

  def show

    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
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
    @post_image.destroy
    redirect_to public_post_images_path
  end

  def keyword
    @user = current_user
    if params[:keyword].present?
      @post_images = PostImage.where('body LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @post_image = PostImage.all
    end
  end

  def hashtag
    @user = current_user
    @hashtag = Hashtag.find_by(hashtag: params[:hashtag])
    @post_imaged = @hashtag.post_images.page(params[:page]).per(20).reverse_order
  end


  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image, :hashbody, hashtag_ids: [])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to public_post_images_path
    end
  end

end
