Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :teachers, only: [:index, :show, :new, :create]
  resources :slots, only: [:index, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]
end
