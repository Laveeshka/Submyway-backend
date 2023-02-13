Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create]
  resources :profiles, only: [:index]
  resources :companies
  resources :subscriptions
  resources :subscription_payments
  get '/next_payment/:id', to: 'subscription_payments#create_next_payment'
  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/logged_in', to: 'application#logged_in?'
end
