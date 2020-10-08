Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#top'
  resources :restaurants, only: [:top, :index, :new, :create, :show, :edit, :update]
end
