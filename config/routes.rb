Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/items', to: "items#index"
      post '/items', to: "items#create"
      get '/items/:id', to: "items#show"
      delete '/items/:id', to: "items#destroy"
    end
  end
  root 'items#index'

  get '/search', to: "search#index"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :stores,  only: [:show]

end
