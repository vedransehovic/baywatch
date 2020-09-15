Rails.application.routes.draw do
  resources :jobs
  resources :clients
  resources :productions
  resources :users
  resources :bays
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
