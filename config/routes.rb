Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#top'
  resources :restaurants do
    collection do 
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
end
