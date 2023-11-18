Rails.application.routes.draw do
  resources :order_lines
  resources :orders
  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"  # Keep this as your root path

  get 'analytics', to: 'analytics#index'

end

