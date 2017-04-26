require_relative 'base'

module Controllers
  class Main < Controllers::Base

    get '/' do
      slim :index
    end

    get '/about' do
      File.new('public/about.html').readlines
    end

    get '/contacts' do
      erb :contacts
    end

    not_found do
	  status 404
	  'Something wrong!'
	end
  end
end
