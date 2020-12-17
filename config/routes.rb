Rails.application.routes.draw do
  devise_for :customers
  resources :products, only: :show
  resources :abouts, only: :index
  resources :categories, only: :show

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_success"
  end

  get "orders/:cus_id&order_id=:order_id", to: "order#show", as: "order"
  get "orders/:cus_id", to: "order#index", as: "orders"
  post "order", to: "order#create", as: "order/create"
  post "cart/:id", to: "cart#create", as: "cart/create"
  delete "cart/:id&qty=:qty", to: "cart#destroy", as: "cart/destroy"
  get "search", to: "products#search", as: "search" # search_path
  get "about", to: "about#index", as: "about"

  root to: "categories#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
