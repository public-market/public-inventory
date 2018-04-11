Rails.application.routes.draw do
  root to: 'home#show'

  namespace :v1 do
    # expose only read-only API
    jsonapi_resources :items, except: %i[create update destroy]
  end
end
