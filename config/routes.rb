Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :books, only: [:index, :create, :destroy]
    end
  end

  resources :books
  root 'api/v1/books#index'
end
