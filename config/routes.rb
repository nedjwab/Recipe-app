Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes, except: :update do
    resources :recipe_foods
  end

  resources :foods, except: :update
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
