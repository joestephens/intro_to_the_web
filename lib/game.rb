class Game
  attr_reader :current_turn

  def initialize(player_1, player_2)
    @players = player_1, player_2
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turn
    @current_turn == player_1 ? @current_turn = player_2 : @current_turn = player_1
  end

  def winner
    player_1.health <= 0 ? player_2 : player_1
  end

  def game_over?
    (player_1.health <= 0 || player_2.health <= 0) ? true : false
  end

  def self.create(player_1, player_2)
    @game = new(player_1, player_2)
  end

  def self.instance
    @game
  end
end
