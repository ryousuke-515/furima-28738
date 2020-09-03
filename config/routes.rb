Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :registrations, only: [:new]
  resources :sessions, only: [:new]
end
