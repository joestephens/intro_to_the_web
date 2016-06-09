require 'attack'

describe Attack do

  let (:dave) {double :dave}
  let (:mittens) {double :mittens, receive_damage: true}

  let (:game) {double :game, current_turn: dave, player_1: dave, player_2: mittens}
  subject{described_class.new(game)}

  it 'damages the player' do
    expect(mittens).to receive(:receive_damage)
    subject.attack
  end
end