require 'game'

describe Game do
  subject(:dave) { double :dave, health: 60 }
  subject(:dead_dave) { double :dave, health: 0 }
  subject(:mittens) {double :mittens, receive_damage: true, health: 60 }
  subject(:game) { described_class.new(dave, mittens) }
  subject(:finished_game) { described_class.new(dead_dave, mittens) }

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

  describe '#game_over?' do
    before do
      allow(Kernel).to receive(:rand).and_return(60)
    end

    it 'returns true when game is finished' do
      expect(finished_game.game_over?).to eq true
    end
  end
end
