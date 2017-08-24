require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = node
    else
      #cur_node = @head
      #until cur_node.next === nil
      #  cur_node = cur_node.next
      #end
      #cur_node.next = node
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head != nil
      if @head.next === nil
        @head = nil
        @tail = nil
      else
        cur_node = @head
        until cur_node.next.next === nil
          cur_node = cur_node.next
        end
        cur_node.next = nil
        @tail = cur_node
      end
    end      
  end

  # This method prints out a representation of the list.
  def print
    if @head != nil
      cur_node = @head
      str = ""
      until cur_node === nil
        str = str + "#{cur_node.data}\n"
        cur_node = cur_node.next
      end
      puts str
    end     
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head === node
      remove_front
    elsif @tail === node
      remove_tail
    else
      cur_node = @head
      until cur_node.next === node
        cur_node = cur_node.next
      end
      cur_node.next = cur_node.next.next  
    end   
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head != nil
      if @head.next  === nil
        @head = nil
        @tail = nil
      else
        head = @head
        @head = @head.next
      end
      head
    end 
  end
end