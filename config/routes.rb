Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/about'

  resources :locations, only: [:create, :show, :update] do
    resources :checkins, only: [:new, :create, :show]
  end

  resources :checkins

  get "/signup", to: "locations#new"
  get "/signin", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get "/profile", to: "locations#edit", as: 'profile'
  
end
