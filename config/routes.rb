Rails.application.routes.draw do
  # resources :categories
  devise_for :admins
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  # resources :comments, only: [:index, :show]
  resources :articles, only: [:index]
  root to: "articles#index"
  get "/:category_name", to: "articles#index"
  get "/:category_name/:id", to: "articles#show"
end
