Rails.application.routes.draw do
  resources :roles
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  root "home#index"

  get "/api/data", to: "api#data"
  get "/api/login", to: "api#login"
end
