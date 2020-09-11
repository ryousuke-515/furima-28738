Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :orders, only: [:index, :create]
  resources :items
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new]
end
