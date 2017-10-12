def bucket_sort(array)
	length = array.max/10 +1
	bucket = Array.new(length){[]}
	array.each do |number|
		bucket_ind = number/10
	  insert(bucket[bucket_ind], number)
	end
	array.clear
	bucket.each do |bucket_array|
		if bucket_array.length != 0
			bucket_array.each do |number|
				array << number
			end
		end
	end
	array
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
#bucket_sort(ar)      

#ar = [3,5,2,1,11,15,6,7,8,10,12,14,0]
#bucket_sort(ar)      
      

#ar = [3,5,3,2,1,11,15,6,6,7,8,10,9,12,14,0,200]
#bucket_sort(ar)   
      	

