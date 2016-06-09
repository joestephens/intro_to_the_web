require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'shhhhhh'

  get '/' do
    erb(:index, :layout => :layout)
  end

  post '/names' do
    @player_1 = Player.new(params[:player_1_name])
    @player_2 = Player.new(params[:player_2_name])
    $game = Game.new(@player_1, @player_2)
    redirect to('/play')
  end

  get '/play' do
    @player_1 = $game.player_1
    @player_2 = $game.player_2
    @current_turn = $game.current_turn.name
    erb(:play, :layout => :layout)
  end

  get '/attack' do
    @player_1 = $game.player_1
    @player_2 = $game.player_2
    @current_turn = $game.current_turn
    Attack.new($game).attack
    erb(:attack, :layout => :layout)
  end

  post '/switch_turn' do
    $game.switch_turn
    redirect to('/play')
  end

  run! if app_file == $0
end
