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
    # filter = params[:filter_by]
    # dishes = Dish.order filter
    @q = Dish.ransack(params[:q])
    dishes = @q.result(distinct: true)
    render json: dishes
  end
  
  def destroy
    @dish.destroy
    render json: {status: 200}
  end

  private
  def dish_params
    params.permit(:name, :dish_type, :description, :price, :image)
  end

  def find_dish
    @dish = Dish.find(params[:id])
  end

end