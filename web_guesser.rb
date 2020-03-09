require 'sinatra'
require 'sinatra/reloader'
enable :sessions

get '/' do
  session[:value] = rand(100)
  redirect "/45"
end

get "/:value" do
  "The secret number is " << session[:value].inspect
end




