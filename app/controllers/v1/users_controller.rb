class V1::UsersController < ApplicationController
before_action :find_user, only: [:show, :update, :destroy]
before_action :authenticate_user!, except: [:create]

def current
  render json: current_user
end

def create
  new_parms = user_params
  new_parms[:password] = params[:password]
  new_parms[:password_confirmation] = params[:password_confirmation]
  @user = User.create new_parms
  if @user.save
    session[:user_id] = @user.id
    render json: @user
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
