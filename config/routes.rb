Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # all restaurants
  # get "restaurants", to: "restaurants#index"
  # # create restaurant
  #   # get form
  # get "restaurants/new", to: "restaurants#new"
  #   # post
  # post "restaurants", to: "restaurants#create"
  # # get one restaurant
  # get "restaurants/:id", to: "restaurants#show", as: "restaurant"
  # # create review
  #   #get form
  # get "restaurants/:id/reviews/new", to: "reviews#new", as: "new_restaurant_review"

  resources :restaurants, only: %i[index new create show] do
    resources :reviews, only: [:new, :create]
  end
end
