Rails.application.routes.draw do
  resources :buildings

  root 'pages#index'
end
