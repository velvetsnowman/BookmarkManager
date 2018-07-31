require './lib/bookmark'
describe Bookmark do
  describe '.all' do
    it 'should show all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: "http://makersacademy.com")
      Bookmark.create(url: "http://destroyallsoftware.com")
      Bookmark.create(url: "http://google.com")

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'should add a bookmark to the database' do
      Bookmark.create(url: 'http://runescape.com')
      expect(Bookmark.all).to include 'http://runescape.com'
    end
  end
end
