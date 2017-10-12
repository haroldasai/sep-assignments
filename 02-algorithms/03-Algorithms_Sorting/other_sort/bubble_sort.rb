def bubble_sort(collection)
  n = collection.length
  begin
    swapped = false

    (n - 1).times do |i|
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
    n = n - 1
  end until not swapped
end

#ar = [3,5,2,1,6,7]
#bubble_sort(ar)      

#ar = [3,5,2,1,11,15,6,7,8,10,12,14,0]
#bubble_sort(ar)      
      
#ar = [3,5,3,2,1,11,15,6,6,7,8,10,9,12,14,0,200]
#bubble_sort(ar)  