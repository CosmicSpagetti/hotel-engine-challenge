class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { api_key: user.token }, status: 201 
    else 
      render json: {error: "Unable to create User"}, status: 409
    end
  end

  private 

  def user_params 
    params.permit(:email, :password, :password_confirmation)
  end
end