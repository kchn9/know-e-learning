Rails.application.routes.draw do
  devise_for :users
  resources :courses
  get '/categories/:id', to: 'categories#show', as: 'categories'
  root 'courses#index'
end
