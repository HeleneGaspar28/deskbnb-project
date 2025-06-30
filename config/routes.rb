Rails.application.routes.draw do
  devise_for :users

  root to: "desks#index"

  resources :desks, only: [:new, :create, :update, :index, :show] do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:create, :index, :show, :update]
  resources :reviews, only: [:destroy]
end
