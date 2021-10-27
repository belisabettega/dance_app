Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post 'book_for_user', to: 'bookings#book_for_user', as: :book_for_user

  resources :teachers, only: [:index, :show, :new, :create]
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
