class Search < ApplicationRecord
    has_many :user_searches 
    has_many :users, through: :user_searches

    validates_presence_of :query
    validates_presence_of :count
end
