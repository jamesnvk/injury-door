class CategoriesController < ApplicationController

  def index
    if params[:post_id]
      @post = Post.find(params[:post_id])
      render 'post_categories'
    else
      @categories = Category.all
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @category = @post.categories.build
  end

  def create
    @post = Post.find(params[:post_id])
    @category = @post.categories.create(category_params)
    if @category.save
      redirect_to @category
    else
      redirect_to post_path(@post), alert: "Your category could not be saved"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
