require 'sidekiq/web'


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => '/sidekiq'

  get '/tracking/carriers', to: 'tracking#carriers'
  post '/tracking/generate_dummy_events', to: 'tracking#generate_dummy_events'
  get '/tracking/:id/events', to: 'tracking#events'
  post '/tracking', to: 'tracking#create'
end
