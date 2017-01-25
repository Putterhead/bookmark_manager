require './models/link'
require 'sinatra/base'
require 'rspec'

class BMM < Sinatra::Base

  get '/' do
    'Hello BMM!'
    redirect '/links'
  end

  get '/links' do # adding links path
    @links = Link.all # using DataMapper to get all the Link ojects
    erb :'links/index' # d
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
