class Api::V1::MoviesController < ApplicationController
    def index
      render json: MovieSerializer.new( Movie.new(MovieService.get_list(params[:genre])) )
    end

    def show
      render json: MovieSerializer.new( Movie.new({ results: MovieService.get_movie(params[:id]) }) )
    end
    
    def search 
      render json: MovieSerializer.new( Movie.new(MovieService.search_movies('query': params[:query])) )  
    end
end