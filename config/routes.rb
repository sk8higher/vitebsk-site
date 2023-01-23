Rails.application.routes.draw do
  devise_for :users
  resources :buildings
  resources :monuments
  resources :museums
  resources :people

  root 'pages#index'
end
