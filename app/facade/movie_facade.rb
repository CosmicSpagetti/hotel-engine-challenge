class MovieFacade

  def self.get_movie(id)
    MovieService.get_movie(id)[:results].map do |movie|
      Movie.new(movie)    
    end
  end

  def self.get_list(filter, params={})
    request = MovieService.get_list(filter, params={})
    movies = request[:results].map do |movie|
      Movie.new(movie)    
    end
    binding.pry
    {dates: request[:dates], page: request[:page], movies: movies, total_pages: request[:total_pages], total_results: request[:total_results]}
  end

  def self.search_movies(params)
    MovieService.search_movies(params)[:results].map do |movie|
      Movie.new(movie)    
    end
  end

end