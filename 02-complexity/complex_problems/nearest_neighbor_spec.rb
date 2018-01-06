include RSpec

require_relative 'city'
require_relative 'path_finder'

RSpec.describe PathFinder, type: Class do
  let (:san_jose) { City.new("San Jose", {}) }
  let (:sunny_vale) { City.new("Sunny Vale", {}) }
  let (:palo_alto) { City.new("Palo Alto", {}) }
  let (:san_francisco) { City.new("San Francisco", {}) }
  let (:itinerary) {PathFinder.new}

  before do
    san_jose.neighbor_hash = {san_francisco=>46, palo_alto=>16, sunny_vale=>8}
    sunny_vale.neighbor_hash = {san_francisco=>40, palo_alto=>9, san_jose=>8}
    palo_alto.neighbor_hash = {san_francisco=>26, sunny_vale=>9, san_jose=>16}
    san_francisco.neighbor_hash = {palo_alto=>26, sunny_vale=>40, san_jose=>46}
  end

  describe "nearest neighbor" do
    it "finds proper path starting from San Jose" do
      expect(itinerary.nearest_neighbor(san_jose)).to eq ["San Jose","Sunny Vale","Palo Alto","San Francisco"]
    end

    it "finds proper path starting from Sunny Vale" do
      expect(itinerary.nearest_neighbor(sunny_vale)).to eq ["Sunny Vale","San Jose","Palo Alto","San Francisco"]
    end

    it "finds proper path starting from Palo Alto" do
      expect(itinerary.nearest_neighbor(palo_alto)).to eq ["Palo Alto","Sunny Vale","San Jose","San Francisco"]
    end

    it "finds proper path starting from San Francisco" do
      expect(itinerary.nearest_neighbor(san_francisco)).to eq ["San Francisco","Palo Alto","Sunny Vale","San Jose"]
    end
  end
end
