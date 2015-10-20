class CommentsController < ApplicationController
  respond_to :html, :json

  def create
    @post = Post.find(params[:post_id])
    respond_to do |format|
      @comment = @post.comments.build(comment_params)
      if @comment.save
        format.js
      else
        @errors = @comment.errors.full_messages.to_sentence
        format.js
      end
    end
  end

  def mark_spam
    @post = Post.find(params[:post_id])
    respond_to do |format|
      @comment = Comment.find(params[:id])
      if @comment.update(spam: true)
        format.js
      end
    end
  end

  def vote
    get_params(params[:post_id],params[:id])
    flag = params[:flag]
    voted = Vote.where(comment_id: @comment.id,user_id: current_user.id).first
    respond_to do |format|
      if voted.blank?
        Vote.create(value: flag, user_id: current_user.id, comment_id: @comment.id)
      elsif voted.present? && voted.value.to_s != flag
        voted.update_attributes(value: flag)
      elsif voted.present? && voted.value.to_s == flag
        voted.destroy
      end
      format.js
    end
  end

  def get_params(post_id,comment_id)
    @post = Post.find(post_id)
    @comment = Comment.find(comment_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy if @comment.user == current_user
    redirect_to post
  end

  def comment_params
    params.require(:comment).permit(:description, :commented_by)
  end
end
