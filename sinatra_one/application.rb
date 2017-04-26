require_relative 'config/configuration'
require "faker"

class Application < Sinatra::Base
  use Controllers::Main
end
