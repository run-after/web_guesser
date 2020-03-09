require 'sinatra'
require 'sinatra/reloader'
enable :sessions
number = rand(100)


get '/' do
  erb :index, :locals => {:number => number}
end





