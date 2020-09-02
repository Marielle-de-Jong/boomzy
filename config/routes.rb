Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, shallow: true
  end

  # resources :bookings, only: :show do

  # end

  resources :chatrooms, only: :show do
      resources :messages, only: :create
    end

  get "/account", to: "account#show"
  patch "/account", to: "account#update"
end
