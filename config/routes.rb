Rails.application.routes.draw do
  
  
  resources :book_details
  resources :lecturas, only: [:new, :create]
  root 'landing_page#index'

  get 'signIn', to: "usuarios#signIn"
  post 'signIn', to: "usuarios#crear", as: "crear"
  get 'logIn', to: "sessions#logIn"
  post 'logIn', to: "sessions#crear", as: "log_in"
  delete 'logOut', to: "sessions#logOut", as: "log_out"
  get 'library', to: 'lecturas#library'
  get 'lecture_search', to: 'lecturas#search'
  get 'book_search', to: 'books#search'
  get 'confirm_rating', to: 'book_details#confirm_rating', as: 'confirm_rating'
  get 'create_rating', to: 'book_details#create_rating', as: 'create_rating'
  get 'save_book', to: 'book_details#save_book', as: 'save_book'

  #get 'amigos',to:'amigos#view'
  get 'amigos', to: 'amigos#view'
  get 'amigos/restricted_action', to: 'amigos#restricted_action'
  get 'amigos/public_action', to: 'amigos#public_action'

  get 'notificaciones', to: 'notificaciones#view'

  # Rutas RESTful para usuarios (incluyendo edit y update)
  resources :usuarios, only: [:edit, :update]

  get 'profile', to:'usuarios#profile', as:'profile'
  get 'edit_user', to:'usuarios#edit_user', as:'edit_user'
  post 'edit_user', to:'usuarios#edit_user'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
