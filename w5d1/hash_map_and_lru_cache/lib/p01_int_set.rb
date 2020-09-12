class MaxIntSet

  attr_reader :store

  def initialize(max)
      @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    # raise "Out of bounds"if !is_valid?(num)
    self.store[num] = true
  end

  def remove(num)
    validate!(num)
    self.store[num] = false
  end

  def include?(num)
    validate!(num)
    # raise "Out of bounds"if !is_valid?(num)
    self.store[num]
  end

  private

  def is_valid?(num)
    # raise "Out of bounds"if !is_valid?(num)
    num >= 0 && num <= self.store.length
  end

  def validate!(num)
    raise "Out of bounds"if !is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num 
      @count += 1
      resize! if count == @store.length
    end
  end

  def remove(num)
    @count -= 1 if include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # @count = 0
    @store.length.times {@store << []}
    @store.each do |bucket|
      bucket.each do |ele|
        bucket.delete(ele)
        @count -= 1
        insert(ele)
      end
    end
  end
end
