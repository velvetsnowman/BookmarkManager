# frozen_string_literal: true

require 'pg'
require 'database_connection'
class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{options[:url]}', '#{options[:title]}') RETURNING id, url, title")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(title, url, id)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
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
