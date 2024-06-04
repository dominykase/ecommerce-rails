# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i(create)#, controller: 'users'
  end
end
