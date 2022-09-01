Rails.application.routes.draw do
  resources :courses, only: %i[ index new create show edit update ]
  root 'courses#index'
end
