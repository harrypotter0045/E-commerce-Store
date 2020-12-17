class CartController < ApplicationController
  def create
    id = params[:id].to_i
    session[:cart].push(id)
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    if params[:qty] == "1"
      session[:cart].delete_at(session[:cart].index(id) || session[:cart].length)
    else
      session[:cart].delete(id)
    end
    redirect_to root_path
  end
end
