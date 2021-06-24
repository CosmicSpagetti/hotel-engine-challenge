require 'rails_helper'

describe 'Movie Db Service',:vcr do 
  it "should return now playing movie list" do 
    movies = MovieService.get_now_playing_movies

    expect(movies).to have_key(:results)
    expect(movies[:results].first).to have_key(:original_title)
    expect(movies[:results].first).to have_key(:overview)
    expect(movies[:results].first).to have_key(:adult)
    expect(movies[:results].first).to have_key(:popularity)
    expect(movies[:results].first).to have_key(:poster_path)
    expect(movies[:results].first).to have_key(:release_date)
    expect(movies[:results].first).to have_key(:title)
    expect(movies[:results].first).to have_key(:vote_average)
    expect(movies[:results].first).to have_key(:vote_count)
    expect(movies[:results].first).to have_key(:genre_ids)
  end

  it "should return popular movie list" do 
    movies = MovieService.get_popular_movies

    expect(movies).to have_key(:results)
    expect(movies[:results].first).to have_key(:original_title)
    expect(movies[:results].first).to have_key(:overview)
    expect(movies[:results].first).to have_key(:adult)
    expect(movies[:results].first).to have_key(:popularity)
    expect(movies[:results].first).to have_key(:poster_path)
    expect(movies[:results].first).to have_key(:release_date)
    expect(movies[:results].first).to have_key(:title)
    expect(movies[:results].first).to have_key(:vote_average)
    expect(movies[:results].first).to have_key(:vote_count)
    expect(movies[:results].first).to have_key(:genre_ids)
  end
end
