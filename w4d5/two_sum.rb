#nested loop, run through every element and add other elements, return true if sum is target.  This would be n**2

# track current element. Element + next element == target_sum return true.
    #else continue next iteration
require "byebug"

def bad_two_sum?(arr,target_sum)
    (0...arr.length).each do |i1|
        (0...arr.length).each do |i2|      
            return true if arr[i1] + arr[i2] == target_sum && i2 > i1
        end
    end
    return false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr,target_sum)
    sorted = arr.sort!
    arr.each do |ele|
        return true if !bsearch(sorted,target_sum-ele).nil? && (ele * 2 != target_sum)
    end
    return false
end

def bsearch(arr,target)
    return nil if arr.empty?
    mid = arr.length / 2
    # debugger
    case target <=> arr[mid]
    when 0 
        return arr[mid]
    when -1 
        bsearch(arr.take(mid),target)
    when 1 
        new_result = bsearch(arr.drop(mid+1),target)
        new_result.nil? ? nil : mid + 1 + new_result
    end
end

arr = [0, 1, 5, 5, 7].shuffle
# p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false