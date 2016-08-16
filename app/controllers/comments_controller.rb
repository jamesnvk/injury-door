class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to @comment.post
    else
      redirect_to post_path(@post), alert: "Your comment could not be saved"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
