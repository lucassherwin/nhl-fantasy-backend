Rails.application.routes.draw do
  resources :players
  resources :teams
  resources :add_user_to_leagues
  resources :users
  resources :leagues

  post '/login', to: 'users#show'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
