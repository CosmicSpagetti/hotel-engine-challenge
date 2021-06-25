require 'rails_helper'

describe 'Movie Db Service',:vcr do 
  it "should return now playing movie list" do 
    movies = MovieService.get_list('now_playing')
    # should create a mock instead of having 3 tests that look the same :/
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
    movies = MovieService.get_list('popular')
    
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


  it 'should return movie you are looking for' do 
    movies = MovieService.search_movies({'query'=> 'matrix'})

    expect(movies).to have_key(:results)
    expect(movies[:results].first).to have_key(:original_title)
    expect(movies[:results].first[:original_title]).to eq('The Matrix')

    movies = MovieService.search_movies({'query'=> 'shawshank redemption'})
    expect(movies[:results].first[:original_title]).to eq('The Shawshank Redemption')
  end

  it 'should be able to paginate with page param added' do 
    movies = MovieService.get_list('upcoming') 

    expect(movies).to have_key(:page)
    expect(movies[:page]).to eq(1)

    movies_2 = MovieService.get_list('upcoming',{'page'=> 2})
    expect(movies_2).to have_key(:page)
    expect(movies_2[:page]).to eq(2)
  end
end
