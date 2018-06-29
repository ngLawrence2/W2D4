require_relative 'my_stack'
require 'byebug'
class StackQueue
attr_reader :store
  def initialize
    @store = MyStack.new
    @temp = MyStack.new
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    until @store.empty?
      @temp.push(@store.pop)
    end
    @store = @temp
    popped = @store.pop

    until @store.empty?
      @temp.push(@store.pop)
    end
    @store = @temp
    popped
  end
end

a = StackQueue.new
a.enqueue('x')
a.enqueue('b')
a.enqueue('r')
a.enqueue('y')
p a.store
a.dequeue
p a.store
