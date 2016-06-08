feature 'attacking Mittens :(' do
  scenario 'Dave attacks Mittens :(' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Dave launches all out assault on Mittens"
  end

  scenario 'reduce player 2 hp by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_link 'OK'
    expect(page).not_to have_content "Mittens: 60HP"
    expect(page).to have_content "Mittens: 50HP"
  end
end
