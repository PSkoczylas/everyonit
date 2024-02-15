# frozen_string_literal: true

Rails.application.routes.draw do
  root 'specialist_ads#index'

  devise_for :users
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end
  resources :users
  resources :specialist_ads

  #  devise_for :users, controllers: { sessions: 'users/sessions',
  #                                    registrations: 'users/registrations',
  #                                    passwords: 'users/passwords' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
