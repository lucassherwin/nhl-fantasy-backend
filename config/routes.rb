Rails.application.routes.draw do
  resources :players
  resources :teams
  resources :users
  resources :player_teams

  post '/login', to: 'users#show'
  post '/signup', to: 'users#create'
  post '/teams', to: 'teams#create'
  post '/player_team', to: 'player_teams#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
