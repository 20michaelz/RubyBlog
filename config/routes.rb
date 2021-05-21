Rails.application.routes.draw do
  #setting up blog
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  root "articles#index"
  
  resources :articles do
    resources :comments
  end

  # setting up authentication
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#logout'
  post 'logout', to: 'sessions#logout'
  get 'home', to: "articles#index"

end
