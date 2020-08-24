Rails.application.routes.draw do
  # get 'items/index'
  devise_for :users
  
  root  'items#index'
  resources :items, only: [:show, :new, :edit, :create]
  get 'items', to: 'items#seles'
  
end
