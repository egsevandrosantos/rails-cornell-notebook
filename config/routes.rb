require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    namespace :v1 do
      resources :users, except: [:index, :destroy] do
        patch 'confirmation/:token', action: 'confirmation', on: :collection
      end
    end
  end
end
