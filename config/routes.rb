Rails.application.routes.draw do
  devise_for :customers
  resources :products, only: :show
  resources :abouts, only: :index
  resources :categories, only: :show

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
