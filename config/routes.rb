Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'restaurants#top'
  resources :restaurants do
    get 'search', 'ranking', on: :collection
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :messages, only: [:index, :create]
  resources :users, only: [:show, :edit, :update]
end
