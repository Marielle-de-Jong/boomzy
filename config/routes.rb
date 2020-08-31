Rails.application.routes.draw do
  get 'listings/index'
  get 'listings/show'
  get 'listings/new'
  get 'listings/create'
  get 'listings/edit'
  get 'listings/update'
  get 'listings/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, shallow: true
  end
end
