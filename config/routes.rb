Rails.application.routes.draw do
  resources :jobs
  resources :productions
  resources :users
  resources :bays
  resources :clients

  resources :productions do
    resources :clients
  end

  get '/', to: 'bays#index'
  get '/bays/reset/:id', to: 'bays#reset'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
