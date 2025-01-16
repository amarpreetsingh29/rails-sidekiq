require 'sidekiq/web'


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => '/sidekiq'
  post '/tracking_events', to: 'tracking_events#schedule'
  get '/tracking_events', to: 'tracking_events#list'
  get '/carriers', to: 'tracking_events#carriers'
end
