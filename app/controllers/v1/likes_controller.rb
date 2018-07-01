class V1::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    dish = Dish.find params[:dish_id]
      like = Like.new( user: current_user, dish: dish )
      if like.save!
        render json: { id: like.id }
      else
        render json: { errors: like.errors.full_messages }
      end
  end

  def destroy
    like = Like.find params[:id]
      like.destroy
      render json: { status: 200 }
  end

end
  
