Rails.application.routes.draw do

  resources :entity, only: [:create]



end
