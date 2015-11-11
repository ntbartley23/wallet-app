Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  devise_scope :user do
get "sign_in", to: "devise/sessions#new"
get "sign_up", to: "devise/registrations#new"
end

  resources :users
end
