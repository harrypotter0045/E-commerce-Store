class CartController < ApplicationController
  def create
    id = params[:id].to_i
    session[:cart] << id
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    if params[:qty] == "All"
      session[:cart].delete(id)
    elsif params[:qty] == "1"
      session[:cart].delete_at(session[:cart].index(id) || session[:cart].length)
    end
    redirect_to root_path
  end
end
