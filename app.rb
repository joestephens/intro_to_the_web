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
    Game.create(@player_1, @player_2)
    redirect to('/play')
  end

  get '/play' do
    @player_1 = Game.instance.player_1
    @player_2 = Game.instance.player_2
    @current_turn = Game.instance.current_turn.name
    erb(:play, :layout => :layout)
  end

  get '/attack' do
    @player_1 = Game.instance.player_1
    @player_2 = Game.instance.player_2
    @current_turn = Game.instance.current_turn
    Attack.new(Game.instance).attack
    erb(:attack, :layout => :layout)
  end

  post '/switch_turn' do
    if Game.instance.game_over?
      redirect to('/game-over')
    else
      Game.instance.switch_turn
      redirect to('/play')
    end
  end

  get '/game-over' do
    @winner = Game.instance.winner.name
    erb(:game_over, :layout => :layout)
  end

  run! if app_file == $0
end
