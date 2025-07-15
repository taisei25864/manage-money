Rails.application.routes.draw do
  namespace :api do
    get 'pokemon', to: 'pokemon#index'
    get '/gmail', to: 'gmail#index'
    post '/gmail', to: 'gmail#create'
    resources :transactions, only: [:index, :create, :show, :update, :destroy] do
      collection do
        post :from_gmail
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  

  # Defines the root path route ("/")
  # root "posts#index"
  Dotenv::Railtie.load if defined?(Dotenv)

  


end
