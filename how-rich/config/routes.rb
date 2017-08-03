Rails.application.routes.draw do

  root 'searches#new'
  resources :searches, only: [:new, :show, :create]
  delete '/signout', to: "sessions#destroy"
  resources :sessions, only: [:new, :create]
  resources :stocks
  resources :users

end
