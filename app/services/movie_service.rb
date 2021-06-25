class MovieService 

  def self.get_now_playing_movies(params = {})
    new.get_results('movie/now_playing', params)
  end

  def self.get_popular_movies(params = {})
    new.get_results('movie/popular', params)
  end

  def self.get_upcoming_movies(params = {})
    new.get_results('movie/upcoming', params)
  end

  def self.search_movies(params)
    new.get_results('search/movie', params)
  end

  def get_results(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private 
  
  def conn 
    Faraday.new("https://api.themoviedb.org/3/") do |f|
      f.params['api_key'] = ENV['MOVIE_DB_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end