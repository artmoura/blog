Rails.application.routes.draw do
  resources :categories
  devise_for :users
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  resources :comments
  resources :articles
  root to: "home#index"
end
