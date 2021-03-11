Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root to: 'home#index'
  devise_for :users
  resources :order, only: [:new, :create]
  resources :cart, only: [:show, :update, :destroy, :edit]
  resources :bills, only: [:destroy, :create]




  scope '/checkout' do
	post 'create', to: 'checkout#create', as: 'checkout_create'
	get 'success', to: 'checkout#success', as: 'checkout_success'
	get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end



  resources :item, only: [:show, :update, :destroy, :edit] do
    resources :picture, only: [:create]
  end

end
