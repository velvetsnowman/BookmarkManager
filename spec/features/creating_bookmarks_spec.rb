feature 'adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://testbookmark.com'
  end

  scenario 'A user can not add an invalid bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'abcxyz')
    click_button('Submit')
    expect(page).not_to have_content "abcxyz"
    expect(page).to have_content "That is not a valid website!"
  end
end
