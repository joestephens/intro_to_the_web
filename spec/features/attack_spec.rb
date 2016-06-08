feature 'attacking Mittens :(' do
  scenario 'Dave attacks Mittens :(' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Dave launches all out assault on Mittens"
  end
end
