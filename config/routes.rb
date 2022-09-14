Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
   root 'foods#index'
  resources :recipes, except: :update do
    resources :recipe_foods
  end

  
  resources :foods, except: :update
  resources :users
end
