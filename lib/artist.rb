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

end