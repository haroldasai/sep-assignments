require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @array = Array.new(size)
    @items = 0
  end

  def []=(key, value)
    i = index(key, size)
    if @array[i] == nil
      @array[i] = Node.new(key, value)
      @items += 1
    else
      oldhead = @array[i]
      @array[i] = Node.new(key, value)
      @items += 1
      @array[i].next = oldhead
    end
    print
    if @max_load_factor < load_factor
      puts "#{load_factor} => resize"
      resize
      puts "resized => #{load_factor}"
    end
  end

  def [](key)
    i = index(key, size)
    cur_node = @array[i]
    until cur_node.key === key
      cur_node = cur_node.next
    end
    cur_node.value
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

  # Calculate the current load factor
  def load_factor
    @items*1.0/size
  end

  # Simple method to return the number of items in the hash
  def size
    @array.length
  end

  # Resize the hash
  def resize
    doubled_array = Array.new(size*2)
    @array.each do |e|
      cur_node = e
      until cur_node == nil
        i = index(cur_node.key, size*2)
        if doubled_array[i] == nil
          doubled_array[i] = Node.new(cur_node.key, cur_node.value)
        else  
          oldhead = doubled_array[i]
          doubled_array[i] = Node.new(cur_node.key, cur_node.value)
          doubled_array[i].next = oldhead
        end
        cur_node = cur_node.next  
      end
    end
    @array = doubled_array   
    print 
  end

  def print
    puts "(START)"
    @array.each_with_index do |e, i|
      cur_node = e
      str = "#{i} "
      until cur_node == nil
        str = str + cur_node.key + ":  " + cur_node.value + "---"
        cur_node = cur_node.next
      end
      puts str
    end
    puts "(END)"      
  end

end
