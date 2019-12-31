Rails.application.routes.draw do
  post 'assistant/create'
  get 'assistant/create/session', to: 'assistant#create_session'

  get 'yelp/index'
  resources :invitations, only: [:update]
  resources :events, only: [:show] do
    resources :invitations, only: [:create, :index]
    resources :events_lists, only: :create
  end
  resources :users, only: [:index, :create, :show] do
    resources :events, only: [:create, :index]
    resources :invitations, only: [:index]
    post 'notifications/create'
  end
  
  resources :contacts, only: [:create]
  resources :login, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
