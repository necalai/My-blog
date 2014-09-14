require 'rubygems'
require 'sinatra'
require 'sinatra/reload'

get '/' do
  erb :index
end
