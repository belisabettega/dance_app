Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post 'book_for_user', to: 'bookings#book_for_user', as: :book_for_user

  resources :users, only: [:edit, :update]

  resources :teachers, only: [:index, :show, :new, :create, :edit, :update]
  resources :slots, only: [:index, :new, :create, :destroy, :update] do
    get 'change', to: 'slots#change', as: :change
    patch 'reserve', to: 'slots#reserve', as: :reserve
    patch 'bookable', to: 'slots#bookable', as: :bookable
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index] do
    patch 'cancel', to: 'bookings#cancel', as: :cancel
  end
end
