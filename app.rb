require 'sinatra/base'
class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:players)
  end

  post '/names' do
   session[:player1] = params[:player1]
   session[:player2] = params[:player2]
   p params
   redirect '/play'
  end

  get '/play' do
  @player1 = session[:player1]
  @player2 = session[:player2]
  p params
  erb(:play)
  end

run! if app_file == $0
end
