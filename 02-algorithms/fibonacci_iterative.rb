def fib(n)
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

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)