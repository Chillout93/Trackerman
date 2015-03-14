Rails.application.routes.draw do
  resources :users
  resources :tv_shows
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :tracked_shows, only: [:create]
  
  root 'pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'search' => 'search#index'
  post 'track_show' => 'tracked_shows#create'
  get 'password_resets/new'
  get 'password_resets/edit'
end
