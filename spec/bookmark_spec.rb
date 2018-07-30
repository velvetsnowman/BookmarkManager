require './lib/bookmark'
describe Bookmark do
  it 'should show all the bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://google.com")
    expect(bookmarks).to include("http://makersacademy.com")
    expect(bookmarks).to include("http://destroyallsoftware.com")
  end

end
