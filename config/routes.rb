Rails.application.routes.draw do
  #main models' routes
  resources :jobs
  resources :productions
  resources :users
  resources :bays
  resources :clients
  resources :sessions, only: [:new, :create, :destroy]

  resources :productions do
    resources :clients
  end

  get '/', to: 'bays#index'
  get '/bays/reset/:id', to: 'bays#reset'

  #sessions' aliases
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #Google auth callback
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
