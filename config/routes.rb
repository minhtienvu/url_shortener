Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'links#index'

  post '/index', defaults: { format: 'json' }, to: 'links#index'
  post '/encode',defaults: { format: 'json' }, to: 'links#encode'
  get '/decode', defaults: { format: 'json' }, to: 'links#decode'

  ## For external API
  get '/api/encode', defaults: { format: 'json' }, to: 'api/external/links#encode'
  get '/api/decode', defaults: { format: 'json' }, to: 'api/external/links#decode'
end
