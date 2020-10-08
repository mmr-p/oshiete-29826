Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#top'
  resources :restaurants
end
