class Attack

  def initialize(game)
    @game = game
  end

  def attack
    opponent_of(@game.current_turn).receive_damage
  end

  private

  def opponent_of(player)
    return @game.player_1 if player == @game.player_2
    @game.player_2
  end
end