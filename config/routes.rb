Rails.application.routes.draw do

    namespace :v1, defaults: { format: :json } do
      # /api/v1/providers
      resources :providers, only: [:new, :index, :create, :show, :destroy, :edit]
    end

  end
