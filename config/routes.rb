Rails.application.routes.draw do
  resources :bookings

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  get "home/index"
  get "/login" => "home#login"

  post "/slack/command", to: "slack/commands#create"
  root to: "home#index"
end
