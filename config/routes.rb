Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :teachers, only: [:index, :show, :new, :create]
  resources :slots, only: [:index, :new, :create] do
    get 'change', to: 'slots#change', as: :change
    patch 'reserve', to: 'slots#reserve', as: :reserve
    patch 'bookable', to: 'slots#bookable', as: :bookable
    resources :bookings, only: [:new, :create]
    post 'book_for_user', to: 'bookings#book_for_user', as: :book_for_user
  end
  resources :bookings, only: [:index] do
    patch 'cancel', to: 'bookings#cancel', as: :cancel
  end
end
