require "byebug"

def range_itt(start,last)
    new_arr = []
    (start...last).each do |num|
        new_arr << num 
    end 
    new_arr 
end 


def range_rec(start,last)   
    return [] if start == last    
 
    [start] + range_rec(start+1,last)  
end 



def exp(el1,el2) # exp(2,0)
    
    return 1 if el2 == 0
    
    el1 * exp(el1,el2-1)
end 


def exp2(el1,el2)
    return 1 if el2 <= 0
    return el1 if el2 == 1 

    return exp2(el1, el2 / 2 ) * exp2(el1, el2 / 2 ) if el2.even? 

    return el1 * (exp2(el1,(el2 - 1) / 2) * exp2(el1,(el2 - 1) / 2)) if el2.odd?
end 

def deep_dup(arr)
    return [arr] if !arr.is_a?(Array)
    new_arr = []

    arr.each do |ele|
        if ele.is_a?(Array)
            # p ele.object_id
            new_arr << deep_dup(ele).dup
            # p new_arr.last.object_id
        else
            new_arr << ele.dup
        end
    end
    new_arr
end 

# a = [1, [2], [3, [4]]]
# # p a.object_id
# b = deep_dup(a)
# p b.object_id

def fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    
    num = fib(n - 1) 

    num << num[ - 1 ] + num[ - 2 ]
end

# p fib(0)
# p fib(1)
# p fib(2)
# p fib(6) 
# p fib(22)

def bsearch(arr, target)
    return nil if arr.length == 0

    mid_point = arr.length / 2 #3

    left = arr[0...mid_point] #[0..2]
    right = arr[mid_point + 1..-1] #[4..5]


    if target < arr[mid_point]
        bsearch(left, target)
    elsif target > arr[mid_point]
        idx = bsearch(right, target)
        p idx
        if idx.nil?
            return nil
        else
            return idx + mid_point + 1
        end
    else
        mid_point
    end
    

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5      #idx = 1 
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# bsearch([1, 2, 3], 1) # => 0
# bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# bsearch([1, 3, 4, 5, 9], 5) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



def our_merge_sort(arr)

    # debugger
    mid_point = arr.length / 2
    left = arr[0...mid_point]
    right = arr[mid_point.. -1]

    if left <= 1 && right <= 1 
        left_sorted = our_merge_sort(left)
        right_sorted = our_merge_sort(right)
    end 


    # p arr
    # if arr.length == 2
    #     return merge(left, right) 
    # # else
    # #     return arr
    # end
    # p right.first
    # left_sorted = our_merge_sort(left) #if !left.first.nil? && left.length > 1
    # p left_sorted
    # right_sorted = our_merge_sort(right) #if !right.first.nil? && right.length > 1
    # p right_sorted
    return merge(left_sorted, right_sorted)
end

def merge(arr1, arr2)
    arr = []
    left = arr1
    right = arr2

    while left.length > 0 && right.length > 0 
        # p left
        # p right
        if left.first <= right.first
            # p "left"
            arr << left.shift
        else
            # p "right"
            arr << right.shift
        end
    end
# p arr
# p "------"
arr + left + right

end

p our_merge_sort([2,7,3,6,2,4,5,4,2,6])

