Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers do
    resources :bookings, only: [:new, :create, :show, :index] do
      member do
        post :accept_booking
        post :decline_booking
      end
    end
      end


  resources :users, except: [:index] do
    resources :bookings, only: [:index, :destroy, :show]
  end

  resources :users, only: [] do
    member do
      get :dashboard, to: "pages#dashboard"
    end
  end
end
