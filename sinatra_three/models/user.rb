module Models
  class User < ActiveRecord::Base
    validates :login, presence: true, uniqueness: true
    validates :password, presence: true

    def self.authenticate_safely(user_name, password)
	    where('login = ? AND password = ?', user_name, password).first
	end
  end
end
