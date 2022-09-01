Rails.application.routes.draw do
  resources :courses, only: %i[ index new create ]
  root 'courses#index'
end
