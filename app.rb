require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/new' do
	erb :new
end

post '/new' do
  @post = params[:post]

  redirect to '/'
end