Rails.application.routes.draw do

  devise_for :users
  resources :userview
  resources :home

  root to: 'home#index'

  resources :users do
    resources :thermometers
  end

  resources :readings, only: [:index, :new, :create, :destroy]


end
