Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  root "root#new"
end
