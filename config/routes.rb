Rails.application.routes.draw do
  get "/bookings", to: "bookings#index"
  post "/bookings/book", to: "bookings#book"
  post "/bookings/release", to: "bookings#release"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  get "/login", to: "home#login"

  post "/slack/command", to: "slack/commands#create"
  root to: "bookings#index"
end
