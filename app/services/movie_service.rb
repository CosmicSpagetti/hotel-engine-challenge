class MovieService 

  def self.get_popular_movies
    new.get_results('now_playing')
  end

  def get_results(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private 
  
  def conn 
    Faraday.new("https://api.themoviedb.org/3/movie/") do |f|
      f.params['key'] = ENV['MOVIE_DB_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end