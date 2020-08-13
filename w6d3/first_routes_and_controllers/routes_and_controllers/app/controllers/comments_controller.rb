class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  
  def index
    if params[:artwork_id]
      @comments = Comment.where(artwork_id: params[:artwork_id])
    else
      @comments = Comment.where(user_id: params[:user_id])
    end
    render json: @comments
  end


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comment_url(@comment.id)
    else
     render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
    
  end

  def destroy
    @comment.destroy
    render json: @comment
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end
