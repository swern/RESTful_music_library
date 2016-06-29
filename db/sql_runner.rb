require('pg')


  def run_sql(sql)
    begin
      db = PG.connect( { dbname:'music_library', host: 'localhost' } )
      result = db.exec( sql )
    ensure
      db.close()
    end
      return result
    end