Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new]
end
