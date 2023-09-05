Rails.application.routes.draw do

  resources :public_recipes, only: :index
  resources :recipes, except: :update
  resources :inventories, except: :update

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
