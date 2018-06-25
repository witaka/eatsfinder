Rails.application.routes.draw do

    namespace :v1, defaults: { format: :json }, shallow: true do
      # v1/providers
      resources :providers, only: [:index, :create, :update, :show, :destroy] do
        resources :dishes, only: [:create, :update, :show, :destroy] 
      end
      resources :dishes, only: [:index]
      resources :users, only: [:create, :update, :show, :destroy]
    end
end
