# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :recipes, except: [:update] do
      resources :recipe_foods
      get '/public_recipes', to: 'public_recipes#public_recipes'
      get '/shopping_list', to: 'shopping_lists#index'
    end
    resources :foods, except: [:update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
