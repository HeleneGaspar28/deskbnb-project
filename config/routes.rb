Rails.application.routes.draw do
  devise_for :users

  root to: "desks#index"

  resources :desks, only: [:new, :create, :update, :index, :show]
  resources :bookings, only: [:create, :index, :show]
end
