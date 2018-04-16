Rails.application.routes.draw do
  get 'likes/create'

  get 'dashboard/show'
  resources :shouts, only: [:create, :show] do
    member do
      post 'like' => 'likes#create'
    end
  end
  root to: 'home#index'
  devise_for :users
  resources :users, only: [:show]
end
