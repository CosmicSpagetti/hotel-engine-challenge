class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request

   def create
    user = User.new(user_params)
    if user.save
      command = AuthenticateUser.call(user.email, user.password)
      if command.success?
        render json: { token: command.result }, status: 201 
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    else 
      render json: {error: "Unable to create User"}, status: :unauthorized
    end
  end

  private 

  def user_params 
    params.permit(:email, :password, :password_confirmation)
  end
end