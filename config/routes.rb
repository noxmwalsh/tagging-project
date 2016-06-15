Rails.application.routes.draw do

  resources :entity, only: [:create]
  resources :tags, only: [:index]
  get '/entity/:identifier', to: 'entity#show'
  delete '/entity/:identifier', to: 'entity#destroy'
  get '/entity/:category/:identifier/stats', to: 'entity#tag_entity_stats'

end
