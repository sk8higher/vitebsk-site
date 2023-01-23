Rails.application.routes.draw do
  devise_for :users
  resources :building, :monuments, :museums

  resources :people do
    resources :artworks
  end

  root 'pages#index'
end
