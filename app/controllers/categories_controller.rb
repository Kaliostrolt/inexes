class CategoriesController < ApplicationController

  before_action :layout_category, only: [:edit, :update, :destroy]

  def index
    @cats = Category.where(user_id: current_user)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id if current_user

      if @category.save
        redirect_to categories_path, notice: 'Category was successfully created.'
      else
       render "new"
      end
  end

  def edit
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html{redirect_to :back}
    end
  end

  private
  def layout_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:user_id, :name, :kind)
  end
end
