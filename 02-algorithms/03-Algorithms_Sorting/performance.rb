require 'benchmark'
require_relative 'quick_sort'
require_relative 'other_sort/selection_sort'
require_relative 'other_sort/insertion_sort'
require_relative 'other_sort/bubble_sort'
require_relative 'other_sort/merge_sort'
require_relative 'bucket_sort/bucket_sort'
require_relative 'heap_sort/heap_sort'

def generate_random_array(length, limit)
  array = []
  length.times do
    array << rand(limit)
  end
  array
end
len = 1000
lim = 1001


ar = generate_random_array(len, lim)
#p ar
Benchmark.bm(30) do |x|
  ac = ar.clone
  x.report("insertion sort:") do
    insertion_sort(ac)
  end

  ac = ar.clone
  x.report("selection sort:") do
    selection_sort(ac)
  end

  ac = ar.clone
  x.report("bubble sort:") do
    bubble_sort(ac)
  end

  ac = ar.clone
  x.report("merge sort:") do
    merge_sort(ac)
  end

  #ac = ar.clone
  #x.report("quick sort_1:") do
  #  quick_sort_recursive_1(ac, 0, ar.length-1)
  #end

  ac = ar.clone
  x.report("quick sort:") do
    quick_sort_recursive_2(ac, 0, ar.length-1)
  end

  ac = ar.clone
  x.report("bucket sort:") do
    bucket_sort(ac)
  end

  ac = ar.clone
  x.report("heap sort:") do
    heap_sort(ac)
  end
end  
#p ar


