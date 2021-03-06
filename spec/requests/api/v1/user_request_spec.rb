require 'rails_helper'

describe 'User endpoint' do 
  before :each do 
    User.destroy_all
  end

  it 'should create a user when email,password, and password confirmation is sent' do 
    params = {"email": "billy@example.com","password": "password123", 'password_confirmation': 'password123'}
    headers = { 'Content-Type': 'application/json', 'Accept': 'application/json'}

    post '/api/v1/users', params: params.to_json, headers: headers

    user = User.find_by(email: params[:email])

    token = AuthenticateUser.call(user.email, params[:password]).result
    
    expect(user.email).to eq('billy@example.com') 

    expect(JSON.parse(response.body)).to have_key('token')
    expect(JSON.parse(response.body)['token']).to eq(token)
  end

  it 'should log user in and respond with their token' do 
    params = {"email": "billy23@example.com","password": "password123" }
    user = User.create!(params)
    headers = {'Content-Type': 'application/json','Accept': 'application/json' }
    token = AuthenticateUser.call(user.email, params[:password]).result

    post '/api/v1/authentication', params: params.to_json, headers: headers

    expect(JSON.parse(response.body)).to have_key('token')
    expect(JSON.parse(response.body)['token']).to eq(token)
  end

  it 'should send error when wrong password is sent' do 
    params = {"email": "billy34@example.com", "password": "bloop"}
    User.create!( params)


    headers = {'Content-Type': 'application/json','Accept': 'application/json'}

    post '/api/v1/authentication', params: {'email': 'billy34@example.com', 'password': 'wrong'}.to_json, headers: headers

    expect(JSON.parse(response.body)).to have_key('error')
    expect(JSON.parse(response.body)['error']['user_authentication']).to eq('invalid credentials')
  end
end