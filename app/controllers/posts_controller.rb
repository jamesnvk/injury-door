class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    #binding.pry
    redirect_to post_path(@post)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, category_ids: [], :categories_attributes => [:name])
    end
   
end
