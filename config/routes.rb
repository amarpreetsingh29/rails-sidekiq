require 'sidekiq/web'


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    get '/tracker', to: 'tracker#index'
    get '/tracker/:tracking_number', to: 'tracker#show'
    post '/tracker', to: 'tracker#create'

    get '/carriers', to: 'carriers#index'
    get '/carrier/:id', to: 'carriers#show'

    get 'tracker/:tracking_number/events', to: 'tracking_events#index'
    post 'tracking_events/generate_dummy', to: 'tracking_events#generate_dummy'

    post 'tracker/:tracking_number/subscribe', to: 'tracker_subscription#create'
    get 'tracker/:tracking_number/subscriptions', to: 'tracker_subscription#show'
  end
end
