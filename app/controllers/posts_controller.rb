class PostsController < ApplicationController

  before_action :set_post, only: [ :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find( params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to @post, notice: 'Post was successfully created.'
    else
      @errors = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
