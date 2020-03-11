
require 'sinatra'
require 'sinatra/reloader'
  @@secret_number = rand(100)
  @@turns = 5

  get '/' do
    if @@turns < 0
      reload_game
    end
    cheat = params['cheat']
    guess = params['guess']
    message = check_guess(guess)
    erb :index, :locals => {:number => @@secret_number, :message => message, :cheat => cheat}
  end

  def check_guess(guess)
  if @@turns > 0
    @@turns -= 1
    if params['guess'] == nil
      'Guess a number between 0 - 100'
    elsif params['guess'].to_i > @@secret_number
      if params['guess'].to_i > @@secret_number + 5
       'Way too high!'
      else 
        'Too high!'
       end
    elsif params['guess'].to_i < @@secret_number
      if params['guess'].to_i < @@secret_number - 5
        'Way too low!'
      else
        "Too low!"
      end
    else 
      @@turns = -1
    "You got it right! The SECRET NUMBER was: #{@@secret_number} New number loaded!"  
    end
  else
    if params['guess'].to_i != @@secret_number
    @@turns = -1
    "Sorry... The number was #{@@secret_number}. Number reloaded, try again if you'd like"
    end
  end
end

def reload_game
  @@turns = 4
  @@secret_number = rand(100)
end
