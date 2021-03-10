Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :carts, only: [:show, :update, :destroy, :edit]
  resources :bills, only: [:destroy, :create]
  resources :items, only: [:show, :update, :destroy, :edit]
end
