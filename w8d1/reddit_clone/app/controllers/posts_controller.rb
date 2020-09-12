class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 
  def show
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def edit
    if is_current_user?(@post.author_id)
      render :edit
    else
      flash[:errors] = ["You are not the author of this post!"]
      redirect_to post_url(@post)
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_ids = post_params[:sub_ids]
    debugger
    if @post.save
      params[:post][:sub_ids].each do |sub_id|
      PostSub.create!(sub_id: sub_id, post_id: @post.id)
    end 
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    if is_current_user?(@post.author_id)
      @post.destroy
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = ["You are not the author of this post!"]
      redirect_to post_url(@post)
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end
