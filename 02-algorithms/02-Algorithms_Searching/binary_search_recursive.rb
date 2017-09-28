def binary_search_recursive(array, start_index, end_index, target)
  if start_index >= end_index
    return "Target not found" 
  else    
    mid_index = (end_index + start_index)/2
    if array[mid_index] == target
  	  return mid_index
  	elsif array[start_index] == target
  	  return start_index
    elsif array[end_index] == target
  	  return end_index  
    elsif array[mid_index] > target
  	  return binary_search_recursive(array, start_index, mid_index - 1, target)	
    elsif array[mid_index] < target	
  	  return binary_search_recursive(array, mid_index + 1, end_index, target)
    end
  end
end

ar = [2,3,5,7,8,9,12,15,18,23,100,101,103,143,145]

puts binary_search_recursive(ar, 0, ar.length-1, 8)
puts binary_search_recursive(ar, 0, ar.length-1, 145)
puts binary_search_recursive(ar, 0, ar.length-1, 1)

ar = [2,3,5,7,8,9,12,15,18,23,100,101,103,143,145,200]

puts binary_search_recursive(ar, 0, ar.length-1, 5)
puts binary_search_recursive(ar, 0, ar.length-1, 143)
puts binary_search_recursive(ar, 0, ar.length-1, 4)