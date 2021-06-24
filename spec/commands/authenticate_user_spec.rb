require 'rails_helper'

describe 'AuthenticateUser' do
  describe '.call' do
    user = User.create("email": "billy123@example.com","password": "password12345", 'password_confirmation': 'password12345')
    it 'succeeds' do
      expect(AuthenticateUser.call(user.email, user.password)).to be_success
    end
  
    it 'fails' do
      expect(AuthenticateUser.call(user.email, 'wrong_password')).to be_failure
    end
  end
end