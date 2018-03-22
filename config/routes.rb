Rails.application.routes.draw do
  get 'dashboard/show'

  root to: 'home#index'
  devise_for :users
end
