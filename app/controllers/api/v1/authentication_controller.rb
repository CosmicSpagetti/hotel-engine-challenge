class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(user_params[:email], user_params[:password])

    if command.success?
      render json: { token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def user_params 
    params.permit(:email, :password )
  end
end