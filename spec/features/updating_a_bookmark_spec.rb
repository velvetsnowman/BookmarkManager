feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    visit('/bookmarks/1/edit')

    fill_in('url', with: "https://www.snakersacademy.com")
    fill_in('title', with: "Snake")
    click_button 'Submit'
    # save_and_open_page

    # expect(current_path).to eq '/bookmarks'
    # expect(page).not_to have_content 'Makers Academy'
    # expect(page).to have_content 'Snake'
  end
end
