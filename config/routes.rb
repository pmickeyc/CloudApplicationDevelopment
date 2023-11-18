Rails.application.routes.draw do
  root 'home#index'
  resources :sales_lines
  resources :sales_headers
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
