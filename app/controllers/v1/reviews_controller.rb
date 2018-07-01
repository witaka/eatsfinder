class V1::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    @review.dish = @dish
    @review.user = current_user

    if @review.save
      render json: @review 
    else
      render json: { errors: @review.errors.full_messages }      
    end
  end

  def index
    dishes = Dish.all
    render json: dishes
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    render json: { status: :ok }, status: :ok
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end
end