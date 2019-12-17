Rails.application.routes.draw do
  get 'yelp/index'
  resources :events, only: [:show]
  resources :users, only: [:create] do
    resources :events, only: [:create, :index]
  end
  resources :login, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
