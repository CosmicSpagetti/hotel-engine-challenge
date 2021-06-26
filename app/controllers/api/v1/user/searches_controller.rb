class Api::V1::User::SearchesController < ApplicationController
  def index
    binding.pry
    render json: SearchSerializer.new(@current.searches)
  end 
end