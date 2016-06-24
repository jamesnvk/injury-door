class CommentsController < ApplicationController
  def create
    #binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to @comment.post
    else
      flash.now[:danger] = "An error has occured"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
