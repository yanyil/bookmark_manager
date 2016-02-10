require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/Bookmark_manager")

class Bookmark < Sinatra::Base
  get '/' do
    erb(:index) 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

class AddBookmark 
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :link, String
  
end

DataMapper.finalize
DataMapper.auto_upgrade!
