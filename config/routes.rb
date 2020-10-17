Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: 'restaurants#top'
  resources :restaurants do
    collection do 
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :messages, only: [:index, :create]

  mount ActionCable.server => '/cable'
end
