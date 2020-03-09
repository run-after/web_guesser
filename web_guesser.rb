require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if params['guess'].to_i > SECRET_NUMBER
   if params['guess'].to_i > SECRET_NUMBER + 5
     'Way too high!'
    else 
      'Too high!'
    end
  elsif params['guess'].to_i < SECRET_NUMBER
    if params['guess'].to_i < SECRET_NUMBER - 5
      'Way too low!'
    else
      "Too low!"
    end
  else
    message = "You got it right! The SECRET NUMBER is: #{SECRET_NUMBER}"
  end
end
