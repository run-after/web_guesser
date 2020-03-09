require 'sinatra'
require 'sinatra/reloader'
enable :sessions
SECRET_NUMBER = rand(100)


get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
if params['guess'].to_i > SECRET_NUMBER
  if params['guess'].to_i > SECRET_NUMBER + 5
    message = 'Way too high!'
  else 
    message = 'Too high!'
  end
elsif params['guess'].to_i < SECRET_NUMBER
  if params['guess'].to_i < SECRET_NUMBER - 5
    message = 'Way too low!'
  else
    message = "Too low!"
  end
else
  message = "You got it right! The SECRET NUMBER is: #{SECRET_NUMBER}"
end
end



