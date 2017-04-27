require 'sinatra/base'
require './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
enable :sessions


  get '/' do
    erb(:players)
  end

  post '/names' do
  $player1 = Player.new(params[:player1])
  $player2 = Player.new(params[:player2])
   p params
   redirect '/play'
  end

  get '/play' do
  @player1 = $player1.name
  @player2 = $player2.name
  @player2_hp = $player2.hp
  p params
  erb(:play)
  end

  get '/attack' do
    game=Game.new
    @player1 = $player1.name
    @player2 = $player2.name
    game.attack(@player2)
    @player2_hp = $player2.hp
    erb(:attack)
  end

run! if app_file == $0
end
