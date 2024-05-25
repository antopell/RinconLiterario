Rails.application.routes.draw do
  resources :book_details
  root 'landing_page#index'

  get 'signIn', to: "usuarios#signIn"
  post 'signIn', to: "usuarios#crear", as: "crear"
  get 'logIn', to: "sessions#logIn"
  post 'logIn', to: "sessions#crear", as: "log_in"
  get 'library', to: 'library#library'
  get 'confirm_rating', to: 'book_details#confirm_rating', as: 'confirm_rating'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
