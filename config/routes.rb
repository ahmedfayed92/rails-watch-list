Rails.application.routes.draw do
  root to: 'movies#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
end
