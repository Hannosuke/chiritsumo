Rails.application.routes.draw do
  resources :posts, only: [:index]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/auth/esa/callback", to: "sessions#create"
end
