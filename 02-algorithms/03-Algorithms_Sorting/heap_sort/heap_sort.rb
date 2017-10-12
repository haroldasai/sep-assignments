require_relative 'binary_heap_tree'

def heap_sort(array)
  root = Node.new(0, array[0])
  tree = BinaryHeapTree.new(root, array)
  (array.length-1).times do
    tree.delete(root, 0)
  end
  tree.array

  #puts tree.root.title
  #puts tree.root.rating
  #puts tree.root.left.title
  #puts tree.root.left.rating
  #puts tree.root.right.title
  #puts tree.root.right.rating
  #puts tree.last_node.title
  #puts tree.last_node.rating
  #p tree.last_full_level
  #p tree.last_level
end

#ar = [3,5,2,1,6,7]
#heap_sort(ar)      

#ar = [3,5,2,1,11,15,6,7,8,10,12,14,0]
#heap_sort(ar)      
      

#ar = [3,5,3,2,1,11,15,6,6,7,8,10,9,12,14,0,200]
#heap_sort(ar)   

#ar = []
#100.times do
#  ar << rand(501)
#end
#heap_sort(ar)

