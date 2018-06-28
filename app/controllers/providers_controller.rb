class ProvidersController < ApplicationController
  before_action :find_provider, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  
  def new
    @provider = Provider.new
  end

  def create
    provider = Provider.new(provider_params)
    provider.user = current_user
    if provider.save!
      render json: {id: provider.id}
    else
      render json: { errors: provider.errors.full_messages }
    end
  end

  private
  def provider_params
    params.require(:provider).permit(:name, :description, :email, :phone_number, :website, :address, :image)
  end

  def find_provider
    @provider = Provider.find params[:id]
  end

end
