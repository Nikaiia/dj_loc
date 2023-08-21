Rails.application.routes.draw do
  get 'offers/show'
  get 'offers/new'
  get 'offers/create'
  get 'offers/destroy'
  get 'offers/index'
  get 'offers/edit'
  get 'offers/update'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  get 'review/show'
  get 'review/new'
  get 'review/create'
  get 'review/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
