Rails.application.routes.draw do

  root 'searches#new'
  delete '/signout', to: "sessions#destroy"
  resources :sessions, only: [:new, :create]
  resources :stocks
  resources :searches
  resources :users

end
