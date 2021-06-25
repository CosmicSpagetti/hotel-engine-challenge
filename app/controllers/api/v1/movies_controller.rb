class Api::V1::MoviesController < ApplicationController
    def index
     render json: MovieSerializer.new( MovieService.get_list(params[:genre]) )
    end
end