Rails.application.routes.draw do
  root 'earnings#index'
  resources :users
  resources :earnings
end
