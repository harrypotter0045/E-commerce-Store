class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def search
    if params[:category] == "None"
      @products = Product.where("name LIKE ?", "%#{params[:search_term]}%")
    else
      @products = Product.where("name LIKE ? and category_id = #{params[:category]}", "%#{params[:search_term]}%")
    end
  end
end
