class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
     respond_to do |format|
      @comment = @post.comments.build(comment_params)
      @comment.save
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
