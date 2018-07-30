require './lib/bookmark'
describe Bookmark do
  it 'should show all the bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.google.com")
    expect(bookmarks).to include("http://www.facebook.com")
    expect(bookmarks).to include("http://www.evieanddaniel.com")
  end

end
