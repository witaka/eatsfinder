Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    # /api/v1/...
    namespace :v1 do
      # /api/v1/providers
      resources :providers, only: [:new, :index, :create, :show, :destroy, :edit]
    end
  end

  resources :providers
end
