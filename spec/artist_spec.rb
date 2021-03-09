require 'spec_helper'

describe(Artist) do

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

end