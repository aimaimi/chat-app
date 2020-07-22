Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
