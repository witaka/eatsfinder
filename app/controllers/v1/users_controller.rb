class V1::UsersController < ApplicationController
before_action :find_user, only: [:show, :update, :destroy]

def create
  @user = User.new user_params
  if @user.save
    render json: @user
    session[:user_id] = @user.id
  else
    render json: { errors: @user.errors.full_messages }
end
end

def show
  render json: @user
end

def update
  if @user.update(user_params)
    render json: @user
  else
    render json: { errors: @user.errors.full_messages }
  end
end

def destroy
  @user.destroy
  render json: {status: 200}
end

private
  def user_params
    params.require(:user).permit(
      :user_name, :full_name, :email, :password, :password_confirmation
    )
  end

  def find_user
    @user = User.find(params[:id])
  end
end