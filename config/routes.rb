Rails.application.routes.draw do

  #  To implement a omniauth callback
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'

  resources :userview
  resources :home

  root to: 'home#index'

  resources :users do
    resources :thermometers
  end

  resources :readings, only: [:index, :new, :create, :destroy]


end
