Rails.application.routes.draw do
  resources :monthly_bills

  root 'earnings#index'
  resources :users
  resources :earnings
end
