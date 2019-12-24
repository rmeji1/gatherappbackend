Rails.application.routes.draw do
  get 'yelp/index'
  resources :events, only: [:show] do
    resources :invitations, only: [:create, :index]
  end
  resources :users, only: [:index, :create, :show] do
    resources :events, only: [:create, :index]
    post 'notifications/create'
  end
  resources :contacts, only: [:create]
  resources :login, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
