Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  root to: 'restaurants#top'
  resources :restaurants do
    collection do 
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :messages, only: [:index, :create]
  resources :users, only: :show
end
