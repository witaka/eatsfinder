class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private
  def authenticate_user!
    unless user_signed_in?
      render json: {status: 401}, status: :unauthorized 
    end
  end
  
end
