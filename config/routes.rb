Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  resources :warehouses, only: %i[show new create edit update destroy]
  resources :suppliers, only: %i[index show new create edit update]
  resources :product_models, only: %i[index show new edit create update]
  resources :orders, only: %i[new create show edit update]
end
