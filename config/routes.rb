Rails.application.routes.draw do
  root to: 'apis/posts/v1/posts#index'

  resources :users
  resources :comments
  resources :topics
  resources :posts
  post 'authenticate', to: 'authentication#authenticate'
  namespace :apis do
    namespace :posts do
      namespace :v1 do
        resources :posts, only: [:index]
      end
      namespace :v2 do
        resources :posts, only: [:index]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
