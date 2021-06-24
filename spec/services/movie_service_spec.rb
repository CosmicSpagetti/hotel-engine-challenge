require 'rails_helper'

describe 'Movie Db Service',:vcr do 
  it "should return popular movie list" do 
    movies = MovieService.get_results('now_playing')

    expect(movie).to have_key(:data)
    expect(movie[:data].first).to have_key(:original_title)
    expect(movie[:data].first).to have_key(:overview)
    expect(movie[:data].first).to have_key(:adult)
    expect(movie[:data].first).to have_key(:popularity)
    expect(movie[:data].first).to have_key(:poster_path)
    expect(movie[:data].first).to have_key(:release_date)
    expect(movie[:data].first).to have_key(:title)
    expect(movie[:data].first).to have_key(:vote_average)
    expect(movie[:data].first).to have_key(:vote_count)
    expect(movie[:data].first).to have_key(:genre_ids)
  end
end
