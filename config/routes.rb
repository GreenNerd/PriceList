Rails.application.routes.draw do
  get 'search/get'

  get 'sessions/new'

  get 'signup',      to: 'users#new'
  post 'signup',     to: 'users#create'

  get 'login',       to: 'sessions#new'
  post 'login',      to: 'sessions#create'
  delete 'logout',   to: 'sessions#destroy'

  get 'search',      to: 'search#get'

  #get 'order_items/create'
  #get 'order_items/update'
  #get 'order_items/destroy'
  #get 'carts/show'
  #get 'products/index'
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy], defaults: { format: 'js' }
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

end
