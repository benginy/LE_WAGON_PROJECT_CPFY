Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Life Moments + booker un life moment
  resources :life_moments, only: [:index, :show, :new, :create] do
    # Booker un life moment (life_moments/:id/booking)
    resources :bookings, only: [:create]
  end

  # Gérer les bookings
  # resources :bookings, only: [:index, :update]
  resources :bookings do
    member do
      patch :accept
      patch :decline
    end
  end

  # Route pour dashboard
   get 'dashboard', to: 'pages#dashboard'
end
