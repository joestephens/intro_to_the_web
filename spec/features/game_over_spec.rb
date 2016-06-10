feature 'Game over' do
  context 'when Dave reaches 0 HP first' do
    before do
      sign_in_and_play
      attack_and_confirm
    end

    scenario 'player 1 loses :(' do
      sign_in_and_play
      allow(Kernel).to receive(:rand).and_return(60)
      attack_and_confirm
      expect(page).to have_content 'Game over. Dave wins!'
    end
  end
end
