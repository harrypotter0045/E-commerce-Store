class CategoriesController < ApplicationController
  require "date"
  def index
    @categories = Category.order(:name)
    @products = if params[:sale] == "1" && params[:sale] == "1"
                  Product.where("sale_stat = :sale AND created_at >= :start_date AND created_at <= :end_date",
                                { sale: true, start_date: Time.zone.now - 3.days, end_date: Time.zone.now })
                         .page(params[:page]).per(10)
                elsif params[:new] == "1"
                  Product.where("created_at >= :start_date AND created_at <= :end_date",
                                { start_date: Time.zone.now - 3.days, end_date: Time.zone.now })
                         .page(params[:page]).per(10)
                elsif params[:sale] == "1"
                  Product.where("sale_stat = ?", true).page(params[:page]).per(10)
                else
                  Product.all.page(params[:page]).per(10)
                end
  end

  def show
    @category = Category.find(params[:id])
  end
end
