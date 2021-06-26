Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do 
      post 'users', to: 'users#create'
      post 'authentication', to: 'authentication#authenticate'
      get 'movies/list/:genre', to: 'movies#index'
      get "movies/search", to: 'movies#search'
      get "movie/:id", to: 'movies#show'
    end
  end
end
