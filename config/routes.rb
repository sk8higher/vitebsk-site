Rails.application.routes.draw do
  devise_for :users
  resources :buildings
  resources :monuments
  resources :museums

  root 'pages#index'
end
