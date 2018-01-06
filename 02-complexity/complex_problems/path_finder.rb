class PathFinder
  def nearest_neighbor(current_city)
    next_city = nil
    route = []
    while current_city.visited == false
      route << current_city.name
      current_city.visited = true
      puts current_city.name

      neighbor_city_array = current_city.neighbor_hash.keys
      neighbor_city_array.each do |neighbor_city|
        if neighbor_city.visited == false
          next_city = neighbor_city
          break
        end
      end

      if next_city == nil || current_city == next_city
        break
      end

      neighbor_city_array.each do |current_neighbor|
        if current_city.neighbor_hash[current_neighbor] < current_city.neighbor_hash[next_city] && current_neighbor.visited == false
          next_city = current_neighbor
        end
      end

      current_city = next_city
    end
    route
  end
end  
