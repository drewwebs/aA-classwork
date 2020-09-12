require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
  
  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable 

  def initialize
    @head = Node.new(:head, true)
    @tail = Node.new(:tail, true)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return nil if empty?
    each {|node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    return false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev
    @tail.prev = new_node
    new_node.prev.next = new_node
    new_node.next = @tail
  end

  def update(key, val)
    return false if empty?
    each do |node|
      if node.key == key
        node.val = val
        return true
      end
    end
    false
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.next.prev = node.prev
        node.prev.next = node.next
      end
    end
  end

  def each
    location = @head
    until location.next == @tail
      location = location.next
      yield location
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
