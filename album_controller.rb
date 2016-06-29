require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/artist')
require_relative('./models/album')

get '/album/new' do
  @artists = Artist.all
  erb(:'album_views/new')
end

post '/album' do
  @artists = Artist.all
  @album = Album.new(params)
  @album.save()
  erb (:'album_views/create')
end