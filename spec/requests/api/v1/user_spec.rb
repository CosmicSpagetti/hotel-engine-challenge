require 'rails_helper'

describe 'User endpoint' do 
  it 'should create a user when email,password, and password confirmation is sent' do 
    params = {"email": "billy@example.com","password": "password123" }

    headers = { 'Content-Type': 'application/json', 'Accept': 'application/json'}

    post '/api/v1/users', params: params headers: headers
  end

  it 'should log user in and respond with their token' do 
    params = {"email": "billy@example.com","password": "password123" }

    User.create!(params)

    headers = {'Content-Type': 'application/json','Accept': 'application/json'}

    post '/api/v1/sessions', params: params, headers: headers

    expect(JSON.parse(response.body)).to have_key('token')
    expect(JSON.parse(response.body)['token']).to be_a String
  end

  it 'should send error when wrong password is sent' do 
    params = {"email": "billy@example.com", "password": "bloop"}
    User.create!( params)


    headers = {'Content-Type': 'application/json','Accept': 'application/json'}

    post '/api/v1/sessions', params: params, headers: headers

    expect(JSON.parse(response.body)).to have_key('error')
    expect(JSON.parse(response.body)['error']).to eq('Unable to authenticate user')
  end
end