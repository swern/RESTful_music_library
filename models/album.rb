require('pg')
require_relative('./artist')

class Album
  attr_reader( :id, :name, :artist_id )

  def initialize( options )
    @id = options['id']
    @name = options['name']
    @artist_id = options['artist_id']
    
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', '#{ @artist_id }') RETURNING *"
    album_data = run_sql(sql)
    @id = album_data.first['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist_data = run_sql( sql )
    artist = Artist.new( artist_data.first )
    return artist
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums_data = run_sql( sql )
    albums = albums_data.map {|album_data| Album.new( album_data)}
    return albums
  end
end
