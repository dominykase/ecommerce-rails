Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post "login" => "session#login"

  resources :users, only: %i(create show)
end
