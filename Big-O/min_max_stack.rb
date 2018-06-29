class MinMaxStack

    def initialize
      @store = []
      @max1, @min1 = nil
    end

    def push(el)
      @store.push(el)
      @max1 = el if @max1.nil? || el > @max1
      @min1 = el if @min1.nil? || @min1 > el
      el
    end

    def max
      @max1
    end

    def min
      @min1
    end

    def pop
      @store.pop
    end

    def empty?
      @store.empty?
    end

    def peek
      @store[-1]
    end

    def size
      @store.length
    end

    private

    attr_reader :store
    attr_accessor :max1, :min1
end
