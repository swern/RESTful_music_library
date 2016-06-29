require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/artist')
# require_relative('./models/album')


get '/artist/new' do
  erb(:'artist_views/new')
end

get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb(:'artist_views/show')
end

post '/artist' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:'artist_views/create')
end

get '/artist' do
  @artists = Artist.all()
  erb(:'artist_views/index')
end

get '/artist/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:'artist_views/edit')
end

post '/artist/:id' do
  @artist = Artist.update(params)
  redirect to("/artist/#{params[:id]}")
end

post '/artist/:id/delete' do
  Artist.destory(params[:id])
  redirect to("/artist")
end





