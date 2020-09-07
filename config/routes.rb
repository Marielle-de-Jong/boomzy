Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :reviews, only: [:new, :create]
    resources :bookings, shallow: true
  end

  # resources :bookings, only: :show do

  # end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  get "/account", to: "account#show"
  patch "/account", to: "account#update"
  get "/users/map", to: "address#index"
  get "/listings/:id/add_image", to: "listings#add_image", as: :add_image
  post "/listings/:id/add_image", to: "listings#post_add_image", as: :post_add_image
  post "/confirm", to: "bookings#confirm"
  post "/decline", to: "bookings#decline"
  post "/cancel", to: "bookings#cancel"

end
