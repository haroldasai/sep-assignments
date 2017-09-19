class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = nil
    @tail = nil
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[@queue.length-1]
  end

  def dequeue
    @queue.shift
    @head = empty? ? nil : @queue[0]
    @tail = empty? ? nil : @queue[@queue.length-1]
  end

  def empty?
    @queue.length == 0
  end
end