feature 'View hit points' do
  scenario 'see Player2 hit points' do
    sign_in_and_play
    hp_bar = find('#player_2_hp')
    expect(hp_bar[:value]).to eq "60"
  end
end
