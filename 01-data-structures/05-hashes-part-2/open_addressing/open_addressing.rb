require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = Node.new(key, value)
    else
      i = next_open_index(i+1)
      if i >= 0
        @items[i] = Node.new(key, value)
      else
        resize
        self[key] = value
      end
    end  
  end

  def [](key)
    i = index(key, size)
    until key == @items[i].key
      i += 1
    end
    @items[i].value  
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    place = 1
    key.each_byte do |c|
      sum = sum + c*place
      place += 1
    end
    sum%size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < @items.length
      if @items[index] == nil
        return index
      end
      index += 1
    end
    -1  
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    items_doubled = Array.new(size*2)
    @items.each do |item|
      if item != nil
        i = index(item.key, size*2)
        items_doubled[i] = item
      end
    end
    @items = items_doubled
  end
end