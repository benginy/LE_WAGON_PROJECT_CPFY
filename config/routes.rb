Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users
  root to: redirect('/life_moments')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Life Moments + booker un life moment
  resources :life_moments do
    # Activate Deactive Logic
    member do
      patch :activate
      patch :deactivate
    end
    # Booker un life moment (life_moments/:id/booking)
    resources :bookings, only: [:create]
  end

  # Gérer les bookings
  # resources :bookings, only: [:index, :update]
  resources :bookings, only: [:index, :show, :create, :update] do
    member do
      patch :accept
      patch :decline
    end
    resources :reviews, only: [:new, :create, :update, :destroy]
  end

  # Route pour dashboard
   get 'dashboard', to: 'pages#dashboard'
end
