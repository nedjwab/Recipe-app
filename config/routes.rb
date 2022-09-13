Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :user
  resources :recipe_foods
  resources :recipes, except: :update
  resources :foods, except: :update
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
