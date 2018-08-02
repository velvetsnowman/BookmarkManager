# frozen_string_literal: true

feature 'view bookmarks' do
  scenario 'A user can see their bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'http://makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://google.com', title: 'Google')
    Bookmark.create(url: 'http://destroyallsoftware.com', title: 'Destroy')
    visit('/bookmarks')
    expect(page).to have_content 'Makers'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Destroy'
  end
end
