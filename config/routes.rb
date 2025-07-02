Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :desks, only: [:new, :create, :update, :index, :show] do
    collection do
      get :mydesks
    end
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :show, :update, :edit]
  resources :reviews, only: [:destroy]
end
