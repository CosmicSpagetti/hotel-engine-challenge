require 'rails_helper'

describe 'Movie request endpoint' do 
  before :each do 
    User.destroy_all
  end

  it 'should return requested movie info' do
    get '/api/v1/movies?query=matrix'

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result.first[:attributes]).to have_key(:original_title)
    expect(movies[:results].first[:original_title]).to eq('The Matrix')
  end
  
end