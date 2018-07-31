feature "view bookmarks" do
  scenario 'A user can see their bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: "http://makersacademy.com")
    Bookmark.create(url: "http://google.com")
    Bookmark.create(url: "http://destroyallsoftware.com")
    visit('/bookmarks')
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://makersacademy.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
  end
end
