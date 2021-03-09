class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(attrs)
    @name = attrs[:name]
    @id = attrs[:id]
  end

  def self.all
    returned_artists = DB.exec("SELECT * FROM artists;")
    artists = []
    returned_artists.each() do |artist|
      name = artist["name"]
      id = artist["id"].to_i
      artists.push(Artist.new({name: name, id: id}))
    end
    artists
  end

  def save
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def ==(artist_to_compare)
    self.name() == artist_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

end