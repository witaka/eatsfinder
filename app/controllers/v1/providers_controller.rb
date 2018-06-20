class V1::ProvidersController < ApplicationController
  before_action :find_rovider, only: [:show, :update, :destroy]

  def new
    @provider = Provider.new
  end

  def create
    provider = Provider.new(product_params)
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
      render json: {id: provider.id}
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
    params.require(:provider).permit(:name,:description,:email,:phone_number,:website,:address)
  end

  def find_rovider
    @provider = Provider.find params[:id]
  end

end
