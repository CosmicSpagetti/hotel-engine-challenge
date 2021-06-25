require 'rails_helper'

describe 'AuthorizeApiRequest' do
  describe '.call' do
    user = User.create("email": "billy12@example.com","password": "password12345", 'password_confirmation': 'password12345')
    user_token = AuthenticateUser.call(user.email, user.password).result 

    it 'succeeds' do
      expect(AuthorizeApiRequest.new({'Authorization'=> user_token}).call.result.email).to eq(user.email)
    end
  
    it 'fails' do
      expect(AuthorizeApiRequest.new({'Authorization'=> 'wrong'}).call.errors[:token]).to eq(['Invalid token'])
    end
  end
end