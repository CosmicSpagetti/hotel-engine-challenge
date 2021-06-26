class Api::V1::MoviesController < ApplicationController
    def index
      current_user.add_or_create_search(request.fullpath)
      render json: MovieSerializer.new( Movie.new(MovieService.get_list(params[:genre])) )
    end

    def show
      current_user.add_or_create_search(request.fullpath)
      render json: MovieSerializer.new( Movie.new({ results: MovieService.get_movie(params[:id]) }) )
    end
    
    def search 
      current_user.add_or_create_search(request.fullpath)
      render json: MovieSerializer.new( Movie.new(MovieService.search_movies('query': params[:query])) )  
    end
end