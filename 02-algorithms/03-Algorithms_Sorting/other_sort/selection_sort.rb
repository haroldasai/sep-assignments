def selection_sort(array)
	min = 0
	min_index = 0
  (array.length-1).times do |index|
  	index.upto(array.length-1) do |num|
  		if num == index
  		  min = array[num]
  		  min_index = index
  		else
  		  if min > array[num]
  		    min = array[num]
  		    min_index = num
  		  end
  		end
  	end
  	temp = array[index]
  	array[index] = array[min_index]
  	array[min_index] = temp
  end
  #p array
end

#ar = [3,5,2,1,6,7]
#selection_sort(ar)      

#ar = [3,5,2,1,11,15,6,7,8,10,12,14,0]
#selection_sort(ar)      
      

#ar = [3,5,3,2,1,11,15,6,6,7,8,10,9,12,14,0,200]
#selection_sort(ar)   

  		       
