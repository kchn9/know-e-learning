Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    get '/enroll/', to: 'courses#enroll', as: 'enroll'
  end
  get '/categories/:id', to: 'categories#show', as: 'categories'
  get '/learning/', to: 'learning#index', as: 'learning'
  root 'courses#index'
end
