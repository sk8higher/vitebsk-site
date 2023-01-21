Rails.application.routes.draw do
  devise_for :users
  resources :buildings
  resources :monuments

  root 'pages#index'
end
