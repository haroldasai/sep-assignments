def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

#ar = [3,5,2,1,6,7]
#p merge_sort(ar)      

#ar = [3,5,2,1,11,15,6,7,8,10,12,14,0]
#p merge_sort(ar)      
      
#ar = [3,5,3,2,1,11,15,6,6,7,8,10,9,12,14,0,200]
#p merge_sort(ar)   
