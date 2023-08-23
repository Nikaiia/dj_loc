Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers do
    resources :bookings, only: [:new, :create]
  end

  resources :users, except: [:index] do
  resources :bookings, only: [:index, :show, :destroy]
  end

  resources :users, only: [] do
    member do
      get :dashboard, to: "pages#dashboard"
    end
  end
end
