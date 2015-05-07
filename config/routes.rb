Rails.application.routes.draw do

  root 'teams#index'
  get    'teamstat'    => 'teams#teamstat'

  resources :teams do 
    resources :stats
  end

end
