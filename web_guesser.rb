
require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = 15#rand(100)
  @@turns = 5

  get '/' do
    if @@turns < 0
      reload_game
    end
    
    guess = params['guess']
    message = check_guess(guess)
    erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
  end

  def check_guess(guess)
  if @@turns > 0 
    @@turns -= 1
    if params['guess'] == nil
      'Guess a number between 0 - 100'
    elsif params['guess'].to_i > SECRET_NUMBER
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
      @@turns = -1
    "You got it right! The SECRET NUMBER was: #{SECRET_NUMBER} New number loaded!"  
    end
  else
    if params['guess'].to_i != SECRET_NUMBER
    @@turns = -1
    "Sorry... The number was #{SECRET_NUMBER}. Number reloaded, try again if you'd like"
    else
      @@turns = -1
      "You're right... The number was #{SECRET_NUMBER}. Number reloaded, try again if you'd like"
    end
  end
end

def reload_game
  load './web_guesser.rb'
end