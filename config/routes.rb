Rails.application.routes.draw do
  get 'courses', to: 'courses#index'
  root 'courses#index'
end
