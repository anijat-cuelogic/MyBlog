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
