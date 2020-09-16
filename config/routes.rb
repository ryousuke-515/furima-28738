Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new]
end
