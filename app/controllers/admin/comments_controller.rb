class Admin::CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
