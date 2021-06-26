require 'rails_helper'

describe 'search request endpoint' do 
  before :each do 
    User.destroy_all
    Search.destroy_all
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
    
    expect(result.first[:attributes][:query]).to eq('/api/v1/movies/list/popular')
    expect(result.second[:attributes][:query]).to eq('/api/v1/movies/list/popular')
    expect(result.second[:attributes][:count]).to eq(2)
    expect(result.third[:attributes][:query]).to eq('/api/v1/movies/list/upcoming')
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
    
    expect(result.first[:attributes][:query]).to eq('/api/v1/movies/list/popular')
    expect(result.first[:attributes][:count]).to eq(2)
    expect(result.second[:attributes][:query]).to eq('/api/v1/movies/list/upcoming')
    expect(result.second[:attributes][:count]).to eq(1)
  end
  
end