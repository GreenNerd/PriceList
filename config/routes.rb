Rails.application.routes.draw do
  get 'signup',      to: 'users#new'

  #get 'order_items/create'
  #get 'order_items/update'
  #get 'order_items/destroy'
  #get 'carts/show'
  #get 'products/index'
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

end
