class V1::DishesController < ApplicationController
  before_action :find_dish, only: [:show, :edit, :update, :destroy]

  def create
    @provider = Provider.find(params[:provider_id])
    @dish = Dish.new(dish_params)
    @dish.provider = @provider

    if @dish.save
      render json: @dish 
    else
      render json: { errors: @dish.errors.full_messages }      
    end
  end
   
  def show 
    render json: @dish
  end
  
  def destroy
    # @dish = Dish.find(params[:id])
    @dish.destroy
    render json: {status: 200}
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :dish_type, :description, :price)
  end

  def find_dish
    @dish = Dish.find(params[:id])
  end

end
