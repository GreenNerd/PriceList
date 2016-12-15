Rails.application.routes.draw do
  get 'sites_admin/index'

  devise_for :auths, controllers: {
    sessions: 'auths/sessions',
    passwords: 'auths/passwords',
    registrations: 'auths/registrations'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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

  get 'SitesAdmin', to: 'sites_admin#index'
  get 'pro_create', to: 'sites_admin#create'

  # resources :products, only: [:index, :show]
  resources :products
  resource :cart, only: [:show, :genpdf]
  resources :order_items, only: [:create, :update, :destroy, :new, :oiedit], defaults: { format: 'js' } do
    member do
      post 'oiedit'
    end
  end
  resources :users
  resources :categories, only: [:index, :create, :update, :destroy, :new, :edit, :show] do
    collection do
      # page where you want to render Sortable tree.
      get :manage
      get :expand
      get :node_manage
      # required for Sortable GUI server side actions
      post :rebuild
      post :expand_node
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

end
