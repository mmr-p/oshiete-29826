Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#top'
  resources :restaurants do
    resources :comments, only: :create
  end
end
