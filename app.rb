ENV["RACK_ENV"] ||= "development"

require './models/data_mapper_setup'
require 'sinatra/base'

class BMM < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello BMM!'
    redirect '/links'
  end

  get '/links' do # adding links path
    @user = session[:user_email]
    @links = Link.all # using DataMapper to get all the Link ojects
    erb :'links/index'
  end

  get '/links/new' do

    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |pass_tag|
      link.tag << Tag.first_or_create(name: pass_tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.link : []
    erb :'/links/index'
  end

  get '/signup/new' do
    erb :'/links/signup'
  end

  post '/signup' do
    user = User.create(email: params[:email])
    session[:user_email] = user.email
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
