Rails.application.routes.draw do
  get 'dashboard/show'
  resources :shouts, only: [:create, :show]
  root to: 'home#index'
  devise_for :users
  resources :users, only: [:show]
end
