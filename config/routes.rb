Rails.application.routes.draw do
  devise_for :users

  root to: "desks#index"

  resources :desks, only: [:new, :create, :update, :index, :show] do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show]
  resources :reviews, only: [:destroy]
end
