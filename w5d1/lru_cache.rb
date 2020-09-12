  class LRUCache
    def initialize(max_size)
        @max_size = max_size
        @underlying_array = []
    end

    def count
      # returns number of elements currently in cache
        @underlying_array.count
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @underlying_array.include?(el)
            if @underlying_array.count == @max_size
                i = @underlying_array.index(el)
                val = @underlying_array[i]
                @underlying_array.delete(@underlying_array[i])
                @underlying_array.push(val)
            else
                @underlying_array.delete(el)
                @underlying_array.push(el)
            end
        else
            if @underlying_array.count == @max_size
                @underlying_array.shift
                @underlying_array.push(el)
                # i = @underlying_array.index(el)
                # val = @underlying_array[i]
                # @underlying_array.delete(arr[i])
                # @underlying_array.push(val)
            else
                @underlying_array.push(el)
            end
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @underlying_array
    end

    private
    # helper methods go here!

  end

   johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show 