require_relative 'node'

class BinaryHeapTree
  attr_accessor :last_node

  def initialize(root)
    @root = root
    @last_node = root
    @last_full_level = []
    @last_full_level << root
    @last_level = []
    @next_spot = root
    @next_spot_index = 0
  end

  def insert(root, node)
    if @next_spot.left == nil
      @next_spot.left = node
      node.parent = @next_spot
      reorder_up(node)
      @last_node = node
      if @next_spot_index == 0
        @last_level = []
      end  
      @last_level << node
      return
    end
    if @next_spot.right == nil
      @next_spot.right = node
      node.parent = @next_spot
      reorder_up(node)
      @last_node = node
      @last_level << node
      if @last_full_level.length == @next_spot_index+1
        @last_full_level = @last_level
        @next_spot = @last_full_level.first
        @next_spot_index = 0
      else
        @next_spot_index += 1
        @next_spot = @last_full_level[@next_spot_index]
      end  
      return 
    end     
  end

  def reorder_up(node)
    while node.parent != nil && node.rating < node.parent.rating do
      swap(node, node.parent)        
      node = node.parent
    end
  end 

  # Recursive Depth First Search
  def find(root, data)
    if root == nil
      return nil
    end  

    if data == nil
      return nil      
    elsif root.title == data
      return root
    end
      
    node_leftside = find(root.left, data)
    return node_leftside if node_leftside != nil

    node_rightside = find(root.right, data)
    return node_rightside if node_rightside != nil      
  end      

  def delete(root, data)
    if data == nil
      return nil
    end  

  	node = find(root, data)
  	swap(node, @last_node)
    if @last_node == @last_node.parent.left
      @last_node.parent.left = nil
    elsif @last_node == @last_node.parent.right
      @last_node.parent.right = nil
    end      
  	@last_node.parent = nil
    @last_level.delete_at(@last_level.length-1)
    if @last_level.length == 0
      @last_node = @last_full_level.last
    else
      @last_node = @last_level.last
    end    
    reorder_up(node)
    reorder_down(node)                                            
  end

  def reorder_down(node)
  	if node.left != nil && node.right == nil 
  	  if node.rating > node.left.rating
  	  	swap(node, node.left)
  	  	reorder_down(node.left)
  	  end	
  	elsif node.left == nil && node.right !=nil
  	  if node.rating > node.right.rating	
  		  swap(node, node.right)
  		  reorder_down(node.right)
  	  end
  	elsif node.left != nil && node.right != nil
  	  smaller = node.left.rating < node.right.rating ? node.left : node.right
  	  if node.rating > smaller.rating	
  		  swap(node, smaller)
  		  reorder_down(smaller)
  	  end
  	end    	
  end	

  def swap(node1, node2)
  	temp_title = node1.title
  	temp_rating = node1.rating
  	node1.title = node2.title
  	node1.rating = node2.rating
  	node2.title = temp_title
  	node2.rating = temp_rating
  end	

  # Recursive Breadth First Search
  def printf(children=[])
    if children.length == 0
      children << @root
    end
    next_children = []
    children.each do |child|
      next_children << child.left if child.left != nil
      next_children << child.right if child.right != nil
      puts "#{child.title}: #{child.rating}"
    end
    printf(next_children) if next_children.length > 0
  end

  def printtree(children=[])
    if children.length == 0
      children << @root
    end
    next_children = []
    str = ""
    children.each do |child|
      next_children << child.left if child.left != nil
      next_children << child.right if child.right != nil
      str += "#{child.rating}:::"
    end
    puts str
    printtree(next_children) if next_children.length > 0
  end

end