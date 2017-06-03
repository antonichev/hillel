require 'socket'
require_relative File.join(File.expand_path("..", Dir.pwd), 'commands', 'tasks')

class Dispatcher
  def initialize()
    @server = TCPServer.new(2000)

    init_db if Task.count.zero?
  end

  def dispatch
    loop do
      Thread.start(@server.accept) do |client|
        tasks_to_send = Task.first(:completed => false).id

        client.puts tasks_to_send
        client.close
      end
    end
  end

  private

  def init_db
    Task.create(:task_name => 'time', :task => "p Time.now", :completed => false)
    Task.create(:task_name => 'stop', :task => "exit", :completed => false)
    Task.create(:task_name => 'date', :task => "p Date.today", :completed => false)
    Task.create(:task_name => 'weather', :task => "p 'weather is cold'", :completed => false)
    Task.create(:task_name => 'location', :task => "p 'location is fine'", :completed => false)
    Task.create(:task_name => 'sleep', :task => "p 'sleeping for 1 sec'; sleep(1000)", :completed => false)
  end
end
