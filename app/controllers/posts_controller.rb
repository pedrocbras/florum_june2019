# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.persisted?
      flash[:notice] = 'Your post was successfully created'
      redirect_to posts_path
    else
      flash[:alert] = 'Invalid Title or Text.'
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
   
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if post_owner
      @post.destroy
    else
      flash[:notice] = 'Access denied as you are not owner of this post'
    end
    redirect_to posts_path  
  end

  private
  
  def post_owner
    @post.user.id == current_user.id
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
