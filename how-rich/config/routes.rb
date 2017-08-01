Rails.application.routes.draw do

  root 'searches#new'
  resources :stocks
  resources :searches
  resources :users

end
