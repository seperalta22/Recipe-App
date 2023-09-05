Rails.application.routes.draw do

  get :public_recipes, to: 'recipes#public_index'
  resources :recipes, except: :update
  resources :inventories, except: :update


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
