require 'sidekiq/web'


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => '/sidekiq'
  get '/tracking/carriers', to: 'tracking#carriers'
  post '/tracking/generate', to: 'tracking#generate'
  get '/tracking/:id', to: 'tracking#events'
end
