require 'game'

describe Game do
  subject(:dave) { double :dave }
  subject(:mittens) {double :mittens, receive_damage: true }
  subject(:game) { described_class.new(dave, mittens) }

  describe '#initalize' do
    it 'has two players at setup' do
      expect(game.player_1).to eq dave
      expect(game.player_2).to eq mittens
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq dave
    end
  end

  describe '#switch_turn' do
    it 'switches the turn' do
      game.switch_turn
      expect(game.current_turn).to eq mittens
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(mittens).to receive(:receive_damage)
      game.attack(mittens)
    end
  end
end
