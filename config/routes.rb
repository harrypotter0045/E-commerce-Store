Rails.application.routes.draw do
  resources :products, only: :show
  resources :categories, only: :show

  get "search", to: "products#search", as: "search" # search_path

  root to: "categories#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
