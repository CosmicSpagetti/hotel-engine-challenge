class User < ApplicationRecord
    has_secure_password 
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password, require: true
    has_many :user_searches 
    has_many :searches, through: :user_searches
end
