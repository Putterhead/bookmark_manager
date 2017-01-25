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
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    p params
    Link.create(params)
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
