feature "view bookmarks" do
  scenario 'A user can see their bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.facebook.com'
    expect(page).to have_content 'http://www.evieanddaniel.com'
  end
end
