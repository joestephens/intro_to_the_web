feature 'View hit points' do
  scenario 'see Player2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens HP: 60'
  end
end
