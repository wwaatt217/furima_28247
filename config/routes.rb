Rails.application.routes.draw do
  devise_for :users
  
  root  'items#index'
  resources :items, only: [:show, :new, :edit, :create, :update, :destroy]
  # resources :buys, only: [:index]
  
end
