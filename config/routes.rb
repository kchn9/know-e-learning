Rails.application.routes.draw do
  devise_for :users
  resources :courses
  get '/enroll/:id', to: 'courses#enroll', as: 'enroll'

  get '/categories/:id', to: 'categories#show', as: 'categories'
  get '/learning/', to: 'learning#index', as: 'learning'
  root 'courses#index'
end
