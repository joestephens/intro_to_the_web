require 'player'

describe Player do
  subject(:dave) { Player.new('Dave') }
  subject(:mittens) { Player.new('Mittens') }


  describe '#name' do
    it "returns player's name" do
      expect(dave.name).to eq "Dave"
    end
  end

  describe '#hit_points' do
    it 'returns the hp' do
      expect(dave.health).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hp' do
      expect { mittens.receive_damage }.to change { mittens.health }.by(-10)
    end
  end
end
