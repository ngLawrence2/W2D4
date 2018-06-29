class MinMaxStackQueue
  attr_reader :store
    def initialize
      @store = MinMaxStack.new

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
      temp = MinMaxStack.new
      until @store.empty?
        temp.push(@store.pop)
      end
      @store = temp
      popped = @store.pop

      temp = MinMaxStack.new
      until @store.empty?
        temp.push(@store.pop)
      end
      @store = temp
      popped
    end

    def min
      @store.min
    end

    def max
      @store.max
    end
end
