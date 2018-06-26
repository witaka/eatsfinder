class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  private
  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method :current_user

  def authenticate_user!
    unless user_signed_in?
      render json:{status:401}
    end
  end
  
end
