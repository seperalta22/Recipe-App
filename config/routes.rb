Rails.application.routes.draw do
  devise_for :users

  root "foods#index"
  get :public_recipes, to: 'recipes#public_index'
  resources :recipes do
    member do
      patch 'toggle_public'
    end
  end
  resources :inventories, except: :update
  resources :foods, except: :update
  resources :inventory_foods
  resources :recipe_foods, except: :update

  get '/shopping_list', to: 'recipes#shopping_list', as: 'shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
