Rails.application.routes.draw do
  devise_for :users
  
  root  'items#index'
  resources :items, only: [:show, :new, :edit, :create, :update, :destroy] do
    resources :buys, only: [:index, :create, :new]
  end
end
