require 'spec_helper'

describe(Artist) do

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an artist') do
      artist = Artist.new({name: "Ice Cube"})
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('#==') do
    it('is the same artist if it has the same attributes') do
      artist = Artist.new({name: "Ice Cube", id: nil})
      artist2 = Artist.new({name: "Ice Cube", id: nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.clear') do
    it('clears all artists') do
      artist = Artist.new({name: "Ice Cube", id: nil})
      artist.save
      artist2 = Artist.new({name: "Ice Cube", id: nil})
      artist2.save
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

end

