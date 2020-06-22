Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  resources :comments
  resources :articles
  root to: "home#index"
  get "/:category_name", to: "home#index"
end
