require 'rails_helper'

describe 'search request endpoint' do 
  before :each do 
    User.destroy_all
  end


  it 'should return users search querys' do
    user = User.create!(email: "billy23@example.com", password: "password123")
    token = AuthenticateUser.call(user.email,"password123").result
    headers = {'Content-Type': 'application/json','Accept': 'application/json', 'Authorization': token }


    get '/api/v1/movies/list/popular', headers: headers 
    get '/api/v1/movies/list/popular', headers: headers 
    get '/api/v1/movies/list/upcoming', headers: headers 

    get '/api/v1/user/searches', headers: headers 

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result[:attributes][:results].first).to eq('/api/v1/movies/list/popular')
    expect(result[:attributes][:results].second).to eq('/api/v1/movies/list/popular')
    expect(result[:attributes][:results].third).to eq('/api/v1/movies/list/upcoming')
  end

  it 'should return all searches with all counts how many times they were searched' do 
    user = User.create!(email: "billy23@example.com", password: "password123")
    token = AuthenticateUser.call(user.email,"password123").result
    headers = {'Content-Type': 'application/json','Accept': 'application/json', 'Authorization': token }


    get '/api/v1/movies/list/popular', headers: headers 
    get '/api/v1/movies/list/popular', headers: headers 
    get '/api/v1/movies/list/upcoming', headers: headers 

    get '/api/v1/searches', headers: headers 

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result[:attributes][:results].first[:query]).to eq('/api/v1/movies/list/popular')
    expect(result[:attributes][:results].first[:count]).to eq(2)
    expect(result[:attributes][:results].second[:query]).to eq('/api/v1/movies/list/upcoming')
    expect(result[:attributes][:results].second[:count]).to eq(1)
  end
  
end