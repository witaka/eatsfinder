class Api::V1::ProvidersController < ApplicationController
  
  def new
    @provider = Provider.new
  end

  def create
    provider = Provider.new(product_params)
    provider.user = current_user
    provider.save!
    render json: {id: provider.id}
  end

  def show
      provider = Provider.find params[:id]
      render json: provider
  end

  def index
      providers = Provider.order created_at: :desc
      render json: providers
  end

  private
  def find_provider
    @provider = Provider.find params[:id]
  end

end
