class V1::ProvidersController < ApplicationController
  before_action :find_provider, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  
  def create
    provider = Provider.new(provider_params)
    provider.user = current_user
    if provider.save!
      render json: {id: provider.id}
    else
      render json: { errors: provider.errors.full_messages }
    end
  end

  def index
    providers = Provider.order created_at: :desc
    render json: providers
  end

  def show
    render json: @provider
  end

  def update
    if @provider.update(provider_params)
      render json: {id: @provider.id}
    else
      render json: { errors: @provider.errors }
    end
  end

  def destroy
    @provider.destroy
    render json: { status: 200 }
  end

  private
  def provider_params
    params.require(:provider).permit(:name, :description, :email, :phone_number, :website, :address)
  end

  def find_provider
    @provider = Provider.find params[:id]
  end

end
