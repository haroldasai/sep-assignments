def binary_search_iterative(array, target)
  start_index = 0
  end_index = array.length - 1
  
  while start_index < end_index do 
    mid_index = (end_index + start_index)/2

    if array[mid_index] == target
  	  return mid_index
  	elsif array[start_index] == target
  	  return start_index
    elsif array[end_index] == target
  	  return end_index  
    elsif array[mid_index] > target
  	  end_index = mid_index - 1	
    elsif array[mid_index] < target	
  	  start_index = mid_index + 1
    end
  end
  puts "Target not found"

end

ar = [2,3,5,7,8,9,12,15,18,23,100,101,103,143,145]

puts binary_search_iterative(ar, 8)
puts binary_search_iterative(ar, 145)
puts binary_search_iterative(ar, 1)

ar = [2,3,5,7,8,9,12,15,18,23,100,101,103,143,145,200]

puts binary_search_iterative(ar, 5)
puts binary_search_iterative(ar, 143)
puts binary_search_iterative(ar, 4)