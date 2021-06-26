class User < ApplicationRecord
    has_secure_password 
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password, require: true
    has_many :user_searches 
    has_many :searches, through: :user_searches

    def add_or_create_search(path)
      search = Search.find_by(query: path)
      if search 
        UserSearch.create(search_id: search.id, user_id: self.id)
        search.update(count: search.count + 1)
      else
        Search.create(query: path, count: 0)
      end
    end
end
