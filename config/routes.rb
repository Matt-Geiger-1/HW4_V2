# Defines route of authentication, places, and entries
Rails.application.routes.draw do
  root to: "places#index"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  resources :places do
    resources :entries, only: [:new, :create]
  end

  resources :entries, only: [:show]
end
