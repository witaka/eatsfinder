Rails.application.routes.draw do
  resources :providers, only: [:new , :create]
  
    namespace :v1, shallow: true do
      resource :session, only: [ :create, :destroy ]
      resources :providers, only: [:index, :create, :update, :show, :destroy] do
        resources :dishes, only: [:create, :update, :show, :destroy] 
      end
      resources :dishes, only: [:index] do
        resources :reviews, only: [:create, :index, :show, :destroy]
        resources :likes, only: [:create, :destroy]
      end
      resources :users, only: [:create, :update, :show, :destroy] do
        get :current, on: :collection
      end
     
    end
end

