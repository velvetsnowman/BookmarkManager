require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'])
    else
      flash[:notice] = "That is not a valid website!"
    end
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
