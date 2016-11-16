require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  cheater_status = params["cheat"]
  message = check_guess(guess)
  second_message = cheat(cheater_status)
  erb :index, :locals => { 
    :number => SECRET_NUMBER,
    :message => message,
    :second_message => second_message
    }
end

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess >SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  elsif guess == SECRET_NUMBER
    "You got it right!"
  end
end

def cheat(cheater_status)
  if cheater_status == "true"
    "The secret number is #{SECRET_NUMBER}"
  else
    "This game is REALLY fun."
  end
end