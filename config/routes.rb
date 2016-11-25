Rails.application.routes.draw do
  get 'search/get'
  get 'sessions/new'

  get 'signup',      to: 'users#new'
  post 'signup',     to: 'users#create'
  get 'login',       to: 'sessions#new'
  post 'login',      to: 'sessions#create'
  delete 'logout',   to: 'sessions#destroy'
  get 'search',      to: 'search#get'
  get'products/addtocart', to: 'products#addtocart'
  post 'order_items/create', to: 'order_items#create'
  get 'order_items/create', to: 'order_items#create'
  get 'cart/genpdf', to: 'carts#genpdf'

  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :genpdf]
  resources :order_items, only: [:create, :update, :destroy, :new, :oiedit], defaults: { format: 'js' } do
    member do
      post 'oiedit'
    end
  end
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

end
