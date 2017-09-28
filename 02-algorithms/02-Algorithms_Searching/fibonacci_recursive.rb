require 'benchmark'

def fib_recursive(n)
  if n == 0
    return 0
  elsif n == 1
   	return 1
  else
    return fib_recursive(n-1) + fib_recursive(n-2)
  end  	
end

def fib_iterative(n)
  fib_0 = 0
  fib_1 = 1
  
  if n == 0
  	fib_n = 0
  elsif n == 1
    fib_n = 1
  end  	

  2.upto(n) do
  	fib_n = fib_0 + fib_1
  	fib_0 = fib_1
  	fib_1 = fib_n
  end
  fib_n		
end

Benchmark.bm(30) do |x|
  x.report("fibonacci fib_iterative") do
    fib_iterative(20)
  end

  x.report("fibonacci fib_recursive") do
    fib_recursive(20)
  end
end


