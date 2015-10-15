class PostsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
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

  def edit
    @post = Post.find( params[:id])
  end

  def update
    if @post.user == current_user
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @post, notice: 'You are not supposed to edit others post'
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
    else
      redirect_to @post, notice: 'You are not supposed to delete others post'
    end
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :author_id)
    end
end
