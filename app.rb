# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/bookmark.rb'
require './database_connection_setup.rb'
# this is a bookmark manager
class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    flash[:notice] = 'That is not a valid website!' unless Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/delete' do
    Bookmark.delete("#{params['id']}")
    redirect '/'
  end

  get '/bookmarks/:id/edit' do ##edit##
    @bookmark_id = params['id']
    erb(:"bookmarks/edit")
  end

  post '/bookmarks/:id/edit' do ##edit##
    Bookmark.update(params[:title], params[:url], params[:id])
    redirect('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end
