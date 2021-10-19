Rails.application.routes.draw do
  get 'slots/index'
  get 'slots/new'
  get 'slots/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :teachers, only: [:index, :show, :new, :create]
  resources :slots, only: [:index, :create] do
    resources :bookings, only: [:create]
  end
end
