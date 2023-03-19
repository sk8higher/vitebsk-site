Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    resources :buildings, :monuments, :museums

    resources :people do
      resources :artworks
    end

    root 'pages#index'
  end
end
