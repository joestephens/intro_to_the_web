feature "Battle Game" do
  scenario "users should be able to add names" do
    sign_in_and_play
    expect(page).to have_content "Dave HP: 60 Mittens HP: 60"
  end
end
