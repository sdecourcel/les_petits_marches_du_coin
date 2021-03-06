Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Attachinary::Engine => "/attachinary"

  # resources :users, only: [:show, :edit, :update]
  resources :locations, only: [:new, :create]

  resources :firms, only: [:new, :create]

  resources :markets, only: [:new, :create, :show]


  namespace :account do
    resources :locations, only: [:index]
    resources :firms, only: [:index]
    namespace :leader do
      resources :markets, only: [:index]
    end
    namespace :supplier do
      resources :markets, only: [:index]
    end
  end

end
