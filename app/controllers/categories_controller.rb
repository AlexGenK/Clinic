class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:destroy]

  def index
    @categories = Category.order(:name)
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    flash[:alert] = 'Unable to add category' unless @category.save
    redirect_to categories_path
  end

  def destroy
    flash[:alert] = 'Unable to delete category' unless @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
