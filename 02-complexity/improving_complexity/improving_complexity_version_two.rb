def poorly_written_ruby(*arrays)
  combined_array = arrays.flatten
  quicksort(0, combined_array.length-1, combined_array)
  combined_array
end

def quicksort(min, max, array)
  i = min
  k = max
  pivot = array[(i + k)/2]
  until i > k do
    while array[i] < pivot do
      i += 1
    end
    while array[k] > pivot do
      k -= 1
    end
    if k < i
      break
    end
    temp = array[i]
    array[i] = array[k]
    array[k] = temp
    i += 1
    k -= 1
  end
  if k > min
    quicksort(min, k, array)
  end
  if i < max
    quicksort(i, max, array)
  end
end
