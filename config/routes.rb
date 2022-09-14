Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'recipes#public'
  resources :users do
    resources :recipes, except: :update do
      resources :recipe_foods
    end
  end

  resources :foods, except: :update
end
