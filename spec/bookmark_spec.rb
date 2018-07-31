require './lib/bookmark'
describe Bookmark do
  describe '.all' do
    it 'should show all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com');")

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end
end
