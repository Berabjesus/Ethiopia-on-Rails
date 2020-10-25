Rails.application.routes.draw do

  resources :sessions, only: %i[new create destroy]
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  resources :users
  resources :categories, only: [:show]
  get '/search', to: 'articles#search'
  
  get '/auth/:provider/callback' => "sessions#oauth"

  root to: 'articles#index'
end
