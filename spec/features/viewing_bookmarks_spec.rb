feature "view bookmarks" do
  scenario 'A user can see their bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://makersacademy.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
  end
end
