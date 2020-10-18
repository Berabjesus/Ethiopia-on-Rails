Rails.application.routes.draw do
  # get 'sessions/index'
  # get 'sessions/show'
  # resources :users
  
  # get 'auth/google_oauth2/callback', to 'sessions#oauth'
  # get '/auth/github/callback', to 'sessions#oauth'
  get '/auth/:provider/callback' => "sessions#oauth"

  root to: 'sessions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
