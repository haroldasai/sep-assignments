class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.unshift(item)
    self.top = item
  end

  def pop
    popped = @stack.shift
    self.top = empty? ? nil : @stack[0]
    popped
  end

  def empty?
    @stack.length === 0
  end
end