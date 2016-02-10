require 'sinatra/base'
require_relative 'models/link'
# require 'data_mapper'
# require 'dm-postgres-adapter'

class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
