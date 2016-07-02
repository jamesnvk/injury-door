class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end


  private
    def post_params
      params.require(:post).permit(:title, :content, category_ids: [], :categories_attributes => [:name])
    end
   
end
