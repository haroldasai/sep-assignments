def poorly_written_ruby(*arrays)
  combined_array = arrays.flatten
  quicksort_iterative(combined_array)
  combined_array
end

def quicksort_iterative(arr)
  stack = []
  stack << 0
  stack << arr.length-1
  while !stack.empty? do
    start_index = stack.shift
    end_index = stack.shift
    if end_index - start_index < 1
      next
    end
    pivot = arr[(start_index + end_index)/2]
    i = start_index
    k = end_index
    until i > k do
      while arr[i] < pivot do
        i += 1
      end
      while arr[k] > pivot do
        k -= 1
      end
      if i > k
        break
      end
      temp = arr[i]
      arr[i] = arr[k]
      arr[k] = temp
      i += 1
      k -= 1
    end
    stack.unshift(end_index)
    stack.unshift(i)
    stack.unshift(k)
    stack.unshift(start_index)
  end
end
