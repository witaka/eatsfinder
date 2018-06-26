class V1::DishesController < ApplicationController
  before_action :find_dish, only: [:show, :update, :destroy]
  before_action :authenticate_user!,except: [:show, :index]

  def create
    @provider = Provider.find(params[:provider_id])
    @dish = Dish.new(dish_params)
    @dish.provider = @provider
    @dish.user = current_user

    if @dish.save
      render json: @dish 
    else
      render json: { errors: @dish.errors.full_messages }      
    end
  end

  def update
    if @dish.update(dish_params)
      render json: @dish
    else
      render json: { errors: @dish.errors }
    end
  end
   
  def show 
    render json: @dish
  end

  def index
    dishes = Dish.order created_at: :desc
    render json: dishes
  end
  
  def destroy
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