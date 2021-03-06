Rails.application.routes.draw do
  resources :users
  resources :tv_shows
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :tracked_shows, only: [:create, :index]
  resources :watched_shows, only: [:create]
  resources :watched_seasons, only: [:create, :destroy]
  resources :watched_episodes, only: [:create, :destroy]
  resources :calendar, only: [:index]
  
  root 'pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'search' => 'search#index'
  get 'password_resets/new'
  get 'password_resets/edit'
end
