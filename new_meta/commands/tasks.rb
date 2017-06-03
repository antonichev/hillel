require 'data_mapper'

class Task
  #The path to database is pretty ugly, sorry...
  DataMapper.setup(:default, "sqlite:///#{File.join(File.expand_path('..', Dir.pwd), 'commands')}/meta.db")

  include DataMapper::Resource

  property :id, Serial
  property :task_name, String
  property :task, String
  property :completed, Boolean

  DataMapper.finalize
  DataMapper.auto_upgrade!
end
