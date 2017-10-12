def insertion_sort(array)
	array_copy = []
  array.each do |number|
  	insert(array_copy, number)
  end
  array_copy
end  	

def insert(ar, num)
  if ar.length == 0
    ar << num
  elsif num < ar[0]
    ar.unshift(num)
  elsif num >= ar[ar.length-1]
    ar << num  
  else
    ar.each_with_index do |number, index|
      if (num >= number && num < ar[index+1])
      	ar.insert(index+1, num)
      	return
      end	
    end
  end
end

#ar = [3,5,2,1,6,7]
#insertion_sort(ar)      

#ar = [3,5,2,1,11,15,6,7,8,10,12,14,0]
#insertion_sort(ar)      
      

#ar = [3,5,3,2,1,11,15,6,6,7,8,10,9,12,14,0,200]
#insertion_sort(ar)   