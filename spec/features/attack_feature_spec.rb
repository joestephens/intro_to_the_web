feature 'attacking Dave :(' do
  scenario 'Dave attacks Mittens :(' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Dave launches all out assault on Mittens"
  end

  scenario 'reduce player 2 hp by 10' do
    sign_in_and_play
    attack_and_confirm
    hp_bar = find('#player_2_hp')
    expect(hp_bar[:value]).to eq "13"
    #expect(page).not_to have_content "Mittens HP: 60"
    #expect(page).to have_content "Mittens HP: 50"
  end

  scenario 'attacked by player 2' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content "Mittens launches all out assault on Dave"
  end
end
