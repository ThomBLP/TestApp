Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/create'
  get 'vehicles/index'
  get 'vehicles/create'
  get 'vehicles/delete'
  devise_for :users

  get 'pages/home'
  root 'vehicles#index'
  resources :vehicles do
    resources :bookings, only: [:new, :create, :index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
