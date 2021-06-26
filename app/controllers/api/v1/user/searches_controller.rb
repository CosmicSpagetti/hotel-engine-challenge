class Api::V1::User::SearchesController < ApplicationController
  def index
    render json: SearchSerializer.new(@current_user.searches)
  end 
end