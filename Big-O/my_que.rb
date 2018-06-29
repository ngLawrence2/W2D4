class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def empty?
    @store.empty?
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  private

  attr_reader :store
end
