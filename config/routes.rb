# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :recipes, except: [:update]
    resources :foods, except: [:update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
