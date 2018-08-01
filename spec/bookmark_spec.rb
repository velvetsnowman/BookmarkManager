# frozen_string_literal: true

require './lib/bookmark'
describe Bookmark do
  describe '.all' do
    it 'should show all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark_1 = Bookmark.create(url: 'http://makersacademy.com', title: 'Makers')
      bookmark_2 = Bookmark.create(url: 'http://destroyallsoftware.com', title: 'Destroy')
      bookmark_3 = Bookmark.create(url: 'http://google.com', title: 'Google')

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'should add a bookmark to the database' do
      bookmark = Bookmark.create(url: 'http://runescape.com')
      expect(Bookmark.all).to include bookmark
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real bookmark')
      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end

  describe '#==' do
    it 'two bookmarks match if their IDs are equal' do
      bookmark_1 = Bookmark.new(1, 'http://testbookmark.com', 'Test')
      bookmark_2 = Bookmark.new(1, 'http://testbookmark.com', 'Test')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end
