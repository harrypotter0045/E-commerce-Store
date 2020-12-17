class ApplicationController < ActionController::Base
  before_action :initialize_session
  def initialize_session
    session[:cart] ||= [] # Empty cart is an empty array.
  end

  helper_method :cart
  def cart
    Product.find(session[:cart]) if session[:cart]
  end

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :phone, :email, :password, :province_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :email, :password, :current_password, :province_id) }
  end
end
