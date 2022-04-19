Rails.application.routes.draw do
  resources :bookings
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  get "home/index"
  get "/login" => "home#login"

  root to: "home#index"
end
