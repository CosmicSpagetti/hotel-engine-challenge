class MovieService 

  def self.get_movie(id)
    new.get_results("movie/#{id}")
  end

  def self.get_list(filter, params={})
    new.get_results("movie/#{filter}", params)
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