class V1::FavoritesController < ApplicationController

  def create
    dish = Dish.find params[:dish_id]
      like = Favorite.new( user: current_user, dish: dish )
      if like.save!
        render json: { id: like.id }
      else
        render json: { errors: like.errors.full_messages }
      end
  end

  def destroy
    like = Favorite.find params[:id]
      like.destroy
      render json: { status: 200 }
  end

end
