Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  resources :users
  resources :movies
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  root 'pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'search' => 'search#index'


  
end
