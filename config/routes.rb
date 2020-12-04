Rails.application.routes.draw do
  resources :products, only: :show
  resources :abouts, only: :index
  resources :categories, only: :show
  resources :cart, only: %i[create destroy]

  get "filter", to: "products#filter", as: "filter"
  get "search", to: "products#search", as: "search" # search_path
  get "about", to: "about#index", as: "about"

  root to: "categories#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
