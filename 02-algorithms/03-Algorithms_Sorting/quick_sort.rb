def quick_sort_recursive_1(array, start_ind, last_ind)
  pivot = array[last_ind]
  i = start_ind
  (last_ind - start_ind).times do
  	if array[i] > pivot
  	  array.insert(last_ind+1, array[i])
  	  array.delete_at(i)
  	elsif array[i] <= pivot
  	  i = i + 1 
  	end
  end
  if start_ind < i - 1
  	quick_sort_recursive_1(array, start_ind, i - 1)
  end
  if last_ind > i + 1
  	quick_sort_recursive_1(array, i + 1, last_ind)
  end
end

def quick_sort_recursive_2(array, start_ind, last_ind)
  pivot = array[(start_ind + last_ind)/2]
  i = start_ind
  k = last_ind
  until i > k do
  	if array[i] >= pivot && array[k] <= pivot 
  	  temp = array[i]
  	  array[i] = array[k]
  	  array[k] = temp
  	  i = i + 1
  	  k = k - 1
    else
  	  if array[i] <= pivot
  	    i = i + 1
  	  end
  	  if array[k] > pivot
  	    k = k - 1   
  	  end
  	end  
  end
  if start_ind < k
    quick_sort_recursive_2(array, start_ind, k)
  end
  if i < last_ind
    quick_sort_recursive_2(array, i, last_ind)
  end   
end  	   

#ar = [6,7,2,1,3,2,0,3,4,5,3,4,2]
#quick_sort_recursive_1(ar, 0, ar.length-1)
#p ar

#ar = [6,7,1,3,2,0,4,5]
#quick_sort_recursive_1(ar, 0, ar.length-1)
#p ar

#ar = [6,3,3,5,7]
#quick_sort_recursive_1(ar, 0, ar.length-1)
#p ar

#ar = [6,5]
#quick_sort_recursive_1(ar, 0, 1)
#p ar

#ar = [6,7,2,1,3,2,0,3,4,5,3,4,2]
#quick_sort_recursive_2(ar, 0, ar.length-1)
#p ar

#ar = [6,7,1,3,2,0,4,5]
#quick_sort_recursive_2(ar, 0, ar.length-1)
#p ar

#ar = [6,3,3,5,7]
#quick_sort_recursive_2(ar, 0, ar.length-1)
#p ar

#ar = [6,5]
#quick_sort_recursive_2(ar, 0, 1)
#p ar





