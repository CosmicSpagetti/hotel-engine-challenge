class Api::V1::SearchesController < ApplicationController
  def index
    render json: SearchSerializer.new(Search.all)
  end
end