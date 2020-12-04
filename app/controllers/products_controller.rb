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

  def filter
    sql = "sale_stat = Yes and created_at BETWEEN #{Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}"
    sql1 = "sale_stat = Yes"
    sql2 = "created_at: #{Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}"
    @products = if (params[:sale] == "1") && (params[:new] == "1")
                  Product.where(sql)
                elsif params[:sale] == "1"
                  Product.where(sql1)
                elsif params[:new] == "1"
                  Product.where(sql2)
                else
                  Product.all
                end
  end
end
