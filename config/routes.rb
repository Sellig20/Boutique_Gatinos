Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :cart, only: [:show, :update, :destroy, :edit]
  resources :item, only: [:show, :update, :destroy, :edit]
end
