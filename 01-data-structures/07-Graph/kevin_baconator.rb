require_relative 'node'

class KevinBaconator
  def initialize(node)
    @start = node
  end

  def find_kevin_bacon(start)
    ar_films = [] 
    ar_nodes = []
    ar_paths = [] #array of ar_films
    ar_paths_nodes = []
    ar_nodes << start
    max_films = 6
    search_bacon(ar_paths, ar_paths_nodes, ar_films, ar_nodes, max_films, start)
    ar_paths.length.times do |index|
      print_path(ar_paths_nodes[index], ar_paths[index])
    end
    ar_paths	
  end

  private

  def search_bacon(array_paths, array_paths_nodes, array_films, array_nodes, max_hops, node)
    if array_films.length < max_hops	
      node.film_actor_hash.each do |key, array|
        if array_films.include?(key) == false
          array_films << key
          array.each do |actor|
            if actor.name == "Kevin Bacon"
              array_nodes << actor
              if array_paths.length == 0
              	array_paths << array_films.clone
              	array_paths_nodes << array_nodes.clone
              elsif array_films.length < array_paths[0].length
                array_paths.clear
              	array_paths << array_films.clone
                array_paths_nodes.clear
              	array_paths_nodes << array_nodes.clone
              elsif array_films.length == array_paths[0].length
              	array_paths << array_films.clone
              	array_paths_nodes << array_nodes.clone
              end
              #print_path(array_nodes, array_films)
              array_nodes.delete_at(array_nodes.length-1)
            elsif array_nodes.include?(actor) == false         	
              array_nodes << actor
              search_bacon(array_paths, array_paths_nodes, array_films, array_nodes, max_hops, actor)
              array_nodes.delete_at(array_nodes.length-1)
            end            
          end
          array_films.delete_at(array_films.length-1)
        end
      end
    end  
  end  

  def print_path(nodes, films)
  	str = ""
  	i = 0
  	k = 0
  	number = nodes.length + films.length
  	number.times do |index|
  	  if index % 2 == 0 && index != number-1
  	  	str += "#{nodes[i].name}---"
  	  	i += 1
  	  elsif index % 2 == 1
  	  	str += "#{films[k]}---"
  	  	k += 1
  	  elsif index == number-1
  	    str += "#{nodes[i].name}"	
  	  end
  	end
  	puts str  			
  end
end	