class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @category = Category.find(params[:id])
  end
end
