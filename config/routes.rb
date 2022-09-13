Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    get '/enroll/', to: 'courses#enroll', as: 'enroll'
  end
  get '/search/', to: "search#index", as: 'search'
  get '/categories/:id', to: 'categories#show', as: 'categories'
  get '/learning/', to: 'learning#index', as: 'learning'
  get '/manage/', to: 'manage#index', as: 'manage'
  root 'courses#index'
end
