Rails.application.routes.draw do
  devise_for :users
  resources :buildings

  root 'pages#index'
end
