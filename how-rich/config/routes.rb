Rails.application.routes.draw do

  root 'searches#new'
  resources :searches, only: [:new, :show, :create]
  delete '/signout', to: "sessions#destroy"
  get '/motivation', to: "users#motivation"
  resources :sessions, only: [:new, :create]
  resources :stocks
  resources :users

end
