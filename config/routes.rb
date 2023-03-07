Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope :api do
    scope :v1 do
      resources :users, only: [:create]
      resources :profiles, only: [:index]
      resources :companies
      resources :subscriptions
      resources :subscription_payments
      resources :categories
      resources :subscription_categories
      get '/next_payment/:id', to: 'subscription_payments#create_next_payment'
      post '/find_or_create_company', to: 'companies#find_or_create'
      post '/login', to: 'auth#create'
      post '/auto_login', to: 'auth#auto_login'
      get '/logged_in', to: 'application#logged_in?'
    end
  end

end
