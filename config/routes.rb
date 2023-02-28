Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'links#index'

  get '/index', defaults: { format: 'json' }, to: 'links#index'
  get '/encode', defaults: { format: 'json' }, to: 'links#encode'
  get '/decode', defaults: { format: 'json' }, to: 'links#decode'

  ## For external API
  get '/api/encode', defaults: { format: 'json' }, to: 'api/external/links#encode'
  get '/api/decode', defaults: { format: 'json' }, to: 'api/external/links#decode'

  resources :users
  post '/api/auth/login', to: 'api/external/authentication#login'

  get '*path', to: redirect { |params, request| RedirectRouteHelper.redirect(params, request) }
end
