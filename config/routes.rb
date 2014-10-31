Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  
  get 'signup' => 'users#new'

  
end
