Rails.application.routes.draw do
  
  resources :users
  resources :account_activations, only: [:edit]
  
  root 'pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  
end
