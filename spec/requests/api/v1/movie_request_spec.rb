require 'rails_helper'

describe 'Movie request endpoint' do 
  before :each do 
    User.destroy_all
  end


  it 'should return filtered index according to genre' do
    user = User.create!(email: "billy23@example.com", password: "password123")
    token = AuthenticateUser.call(user.email,"password123").result
    headers = {'Content-Type': 'application/json','Accept': 'application/json', 'Authorization': token }


    get '/api/v1/movies/list/popular', headers: headers 

    binding.pry
    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result.first[:attributes]).to have_key(:original_title)
    expect(movies[:results].first[:original_title]).to eq('The Matrix')
  end

  it 'should return queried movie info returns array' do
    user = User.create!(email: "billy23@example.com", password: "password123")
    token = AuthenticateUser.call(user.email, "password123").result
    headers = {'Content-Type': 'application/json','Accept': 'application/json', 'Authorization': token }.to_json

    get '/api/v1/movies/search?query=matrix', headers: headers

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result.first[:attributes]).to have_key(:original_title)
    expect(movies[:results].first[:original_title]).to eq('The Matrix')
  end

  it 'should return requested movie info' do
    user = User.create!(email: "billy23@example.com", password: "password123")
    token = AuthenticateUser.call(user.email,"password123").result
    headers = {'Content-Type': 'application/json','Accept': 'application/json', 'Authorization': token }.to_json

    get '/api/v1/movies/588921'

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result.first[:attributes]).to have_key(:original_title)
    expect(movies[:results].first[:original_title]).to eq('Ainbo: Spirit of the Amazon')
  end
  
end