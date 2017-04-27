require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
enable :sessions


  get '/' do
    erb(:players)
  end

  post '/names' do
  $game = Game.new(Player.new(params[:player1]),Player.new(params[:player2]))
   p params
   redirect '/play'
  end

  get '/play' do
  @game = $game
  @game.player1 = $game.player1.name
  @player2 = $game.player2.name
  @player2_hp = $game.player2.hp
  p params
  erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player2)
    erb(:attack)
  end

run! if app_file == $0
end
