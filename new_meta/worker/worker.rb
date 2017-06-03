require 'socket'
require_relative File.join(File.expand_path("..", Dir.pwd), 'commands', 'tasks')

class Worker
  def listen
    loop do
      get_task
    end
  end

  private

  def get_task
    s = TCPSocket.new 'localhost', 2000

    while line = s.gets
      execute_task(line)
    end
    s.close
  end

  def execute_task(task_id)
    current_task = Task.get(task_id.to_i)

    begin
      puts "Trying to execute #{current_task.task_name}..."

      eval("#{current_task.task}")

      puts 'OK! Task will be marked as completed'

      current_task.completed = true
      current_task.save
    rescue KeyError => e
      puts "unknown command: #{e.message}"
    end
  end
end
