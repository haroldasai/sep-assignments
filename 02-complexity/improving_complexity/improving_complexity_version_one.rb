def poorly_written_ruby(*arrays)
  #combined_array = []
  #arrays.each do |array|
  #　array.each do |value|
  #    combined_array << value
  #  end
  #end
  combined_array = arrays.flatten

  #sorted_array = [combined_array.delete_at(combined_array.length-1)]
  sorted_array = [combined_array.pop]

  #for val in combined_array
  #  i = 0
  #  while i < sorted_array.length
  #    if val <= sorted_array[i]
  #      sorted_array.insert(i, val)
  #      break
  #    elsif i == sorted_array.length - 1
  #      sorted_array << val
  #      break
  #    end
  #    i+=1
  #  end
  #end

  combined_array.each do |val|
    sorted_array.each_with_index do |item, index|
      if val <= item
         sorted_array.insert(index, val)
         break
      elsif item == sorted_array.last
         sorted_array << val
         break
      end
    end
  end
  # Return the sorted array
  sorted_array
end
