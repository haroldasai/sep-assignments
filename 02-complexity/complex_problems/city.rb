class City
  attr_accessor :name
  attr_accessor :visited
  attr_accessor :neighbor_hash

  def initialize(name, hash)
    @name = name
    @visited = false
    @neighbor_hash = hash
  end
end
