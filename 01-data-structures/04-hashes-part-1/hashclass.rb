class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = HashItem.new(key, value)
      print
    else
      if @items[i].key == key
        if @items[i].value != value
          resize
          @items[index(key, size)].value = value
          print
        end  
      else
        until @items[i] == nil do
          resize
          i = index(key, size)
        end
        @items[i] =  HashItem.new(key, value)
        print 
      end 
    end    
  end


  def [](key)
    @items[index(key, size)].value
  end

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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def print
    puts "(START)"
    @items.each_with_index do |item, ind|
      if item != nil
        puts "#{ind} #{item.key}"
        puts "value #{item.value}"
      else
        puts "#{ind} empty"
      end
    end
    puts "(END)"
  end        

end