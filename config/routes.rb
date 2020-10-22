Rails.application.routes.draw do
  # get 'categories/show'
  # get 'articles/index'
  # get 'articles/new'
  # get 'articles/show'
  # get 'sessions/index'
  # get 'sessions/show'
  resources :sessions, only: %i[new create destroy]
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  resources :users
  resources :categories, only: [:show]

  
  # get 'auth/google_oauth2/callback', to 'sessions#oauth'
  # get '/auth/github/callback', to 'sessions#oauth'
  get '/auth/:provider/callback' => "sessions#oauth"

  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
