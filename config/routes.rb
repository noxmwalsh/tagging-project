Rails.application.routes.draw do

  resources :entity, only: [:create, :show]
  get '/entity/:identifier', to: 'entity#show'


end
