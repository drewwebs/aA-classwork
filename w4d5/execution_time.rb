require "byebug"
def my_min(arr)
    arr.each do |el1|
        smallest = true
        arr.each do |el2|
            if el1 > el2
                smallest = false
            end
        end
        return el1 if smallest == true
    end
end
# n^2

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def my_min2(arr)
    smallest = arr[0]
    arr.each { |ele| smallest = ele if ele < smallest}
    smallest 
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)
# # n

def largest_contiguous_subsum(list)
    subs = []
    list.each_with_index do |ele1,i1|        #
        list.each_with_index do |ele2,i2|    #
            if i2 > i1                       #
                subs << list[i1..i2]         # n**3 / 4 (or just n**3)
            end                              #
        end                                  #
    end                                      #
    sub_sums = []
    subs.each { |sub| sub_sums << sub.sum } 
    sub_sums.max
end
#n**3
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) 

def largest_contiguous_subsum2(list)
    largest = list[0]
    current_sum = 0

    return list.max if list.all? {|n| n < 0 }

    list.each do |ele|
        current_sum += ele
        if ele > current_sum
            current_sum = ele
        end
        if current_sum > largest
            largest = current_sum
        end
    end
    
    return largest
end
# n
# list = [2, 3, -6, 7, -6, 7]
# list = [-5, -1, -3]
list = [5, 3, -7]
# list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) 

