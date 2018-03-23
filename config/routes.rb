Rails.application.routes.draw do
  get 'shouts/create'

  get 'dashboard/show'
  resources :shouts, only: :create
  root to: 'home#index'
  devise_for :users
end
