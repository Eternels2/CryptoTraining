Rails.application.routes.draw do
  resources :pages
  devise_for :users
  root to: 'pages#home'

  authenticated :user do
    root to: "pages#home", as: :authenticated_root
  end

  resources :cryptos, only: [:index, :show] do
    resources :holdings, only: [:index, :create, :update]
    resources :watchlists, only: [:create]
  end

  resources :holdings, only: [:dashboard, :update]
  resources :watchlists, only: [:index, :destroy]

  get 'dashboard', to: 'holdings#dashboard'
  get 'lessons', to: 'pages#lessons'
  get :reset_holdings, to: 'holdings#reset_holdings', as: 'reset_holdings'
  get 'api/holdings', to: 'holdings#user_holdings'
  get 'api/find/crypto/:id', to: 'cryptos#find'
end
