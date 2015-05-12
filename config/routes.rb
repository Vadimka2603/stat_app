Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'teams#index'
  get    'getstat'    => 'static_pages#getstat'

  resources :teams, only: [:show, :index] do 
    resources :stats, only: [:show, :index]
  end
  
  resources :stats, only: [:show, :index]
end
