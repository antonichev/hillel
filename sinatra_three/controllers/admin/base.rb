require_relative '../base'

module Controllers
  module Admin
    class Base < Controllers::Base
      use Rack::Auth::Basic do |username, password|
        !Models::User.authenticate_safely(username, password).nil?
      end
    end
  end
end
