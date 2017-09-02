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
      i = next_open_index(i)
      if i >= 0
        @items[i] = Node.new(key, value)
      else
        resize
        self[key] = value
      end
    end
    print  
  end

  def [](key)
    i = index(key, size)
    until key === @items[i%size].key
      i += 1
    end
    @items[i%size].value  
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
    start_index = index
    index += 1
    until index%size == start_index
      if @items[index%size] == nil
        return index%size
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
    old_hash = @items
    @items = Array.new(size*2)
    old_hash.each do |item|
      if item != nil
        self[item.key] = item.value  
      end
    end
  end

  def print
    puts "(START)"
    @items.each_with_index do |item, ind|
      if item != nil
        puts "#{ind} #{item.key} -- #{item.value}"
      else
        puts "#{ind} empty"
      end
    end
    puts "(END)"
  end
end
