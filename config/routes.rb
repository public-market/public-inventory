Rails.application.routes.draw do
  root to: 'home#show'

  namespace :v1 do
    # expose only read-only API
    jsonapi_resources :items, only: %i[index show]
    jsonapi_resources :categories, only: %i[index show] do
      jsonapi_relationships only: %i[index show]
    end
  end
end
