# frozen_string_literal: true

require 'pg'
class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(options)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    return false unless is_url?(options[:url])
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{options[:url]}', '#{options[:title]}') RETURNING id, url, title")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def ==(other)
    @id = other.id
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI.regexp(%w[http https])}\z/
  end
end
