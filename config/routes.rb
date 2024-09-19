Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'products#index'
  resources :products

  get 'cart', to: 'carts#show'
  resources :cart_items, only: [:create, :destroy, :update]
end
