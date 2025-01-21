require 'sidekiq/web'


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :tracking do
      get '/carriers', to: 'tracking#carriers'
      post '/generate_dummy_events', to: 'tracking#generate_dummy_events'
      get '/:id/events', to: 'tracking#events'
      post '/', to: 'tracking#create'
    end
  end
end
