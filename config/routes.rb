Rails.application.routes.draw do
  resources :courses, only: %i[ index new create show ]
  root 'courses#index'
end
