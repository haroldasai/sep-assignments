require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    else
      if root.right == nil
        root.right = node
      else
        insert(root.right, node)
      end
    end  
  end

  # Recursive Depth First Search O(n)
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

  # Binary search O(logn)
  def find_binary(root, data)
    if root == nil
      return nil
    end  

    if data == nil
      return nil      
    elsif root.title == data
      return root
    end

    if root.rating > data
      return find_binary(root.left, data)
    else
      return find_binary(root.right, data)
    end
  end       


  def delete(root, data)
    return nil if data == nil
    node = find(root, data)
    parent = find_parent(root, node) 
    if node.left == nil && node.right == nil
      if parent == nil
        @root = nil
      elsif parent.left == node
        parent.left = nil
      elsif parent.right == node
        parent.right = nil
      end  
    elsif node.left != nil && node.right == nil
      if parent == nil
        @root = root.left
      elsif parent.left == node
        parent.left = node.left
      elsif parent.right == node
        parent.right = node.left
      end      
    elsif node.left == nil && node.right != nil
      if parent == nil
        @root = root.right
      elsif parent.left == node
        parent.left = node.right
      elsif parent.right == node
        parent.right = node.right
      end
    elsif node.left != nil && node.right != nil
      if parent == nil
        @root = root.left
        cur_node = root.left
        until cur_node.right == nil
          cur_node = cur_node.right
        end
        cur_node.right = root.right
      elsif parent.left == node
        parent.left = node.left
        cur_node = node.left
        until cur_node.right == nil
          cur_node = cur_node.right
        end
        cur_node.right = node.right
      elsif parent.right == node
        parent.right = node.left
        cur_node = node.left
        until cur_node.right == nil
          cur_node = cur_node.right
        end
        cur_node.right = node.right
      end  
    end                                                    
  end

  def delete_fast(root, data)
    return nil if data == nil
    node = find_binary(root, data)
    parent = find_parent(root, node) 
    if node.left == nil && node.right == nil
      if parent == nil
        @root = nil
      elsif parent.left == node
        parent.left = nil
      elsif parent.right == node
        parent.right = nil
      end  
    elsif node.left != nil && node.right == nil
      if parent == nil
        @root = root.left
      elsif parent.left == node
        parent.left = node.left
      elsif parent.right == node
        parent.right = node.left
      end      
    elsif node.left == nil && node.right != nil
      if parent == nil
        @root = root.right
      elsif parent.left == node
        parent.left = node.right
      elsif parent.right == node
        parent.right = node.right
      end
    elsif node.left != nil && node.right != nil
      if parent == nil
        @root = root.left
        cur_node = root.left
        until cur_node.right == nil
          cur_node = cur_node.right
        end
        cur_node.right = root.right
      elsif parent.left == node
        parent.left = node.left
        cur_node = node.left
        until cur_node.right == nil
          cur_node = cur_node.right
        end
        cur_node.right = node.right
      elsif parent.right == node
        parent.right = node.left
        cur_node = node.left
        until cur_node.right == nil
          cur_node = cur_node.right
        end
        cur_node.right = node.right
      end  
    end                                                    
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

  def find_parent(root, node)
    if root == nil
      return nil
    elsif root == node
      return nil
    elsif root.left == node || root.right == node
      return root  
    elsif root.rating > node.rating
      return find_parent(root.left, node)
    elsif root.rating <= node.rating
      return find_parent(root.right, node)    
    end   
  end

end
