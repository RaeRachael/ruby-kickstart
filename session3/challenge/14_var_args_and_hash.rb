# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# If no hash is provided, choose count_clumps
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value.
# Return the number of clumps in the given arguments.
#
# problem_14 1, 2, 2, 3, 4, 4, :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1,    :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1,    :problem => :count_clumps    # => 1
#
#
# PROBLEM: same_ends
# Return true if the group of N numbers at the start and end of the array are the same.
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3.
# You may assume that n is in the range 0..nums.length inclusive.
#
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false
# problem_14 2,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => true
# problem_14 3,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false

def problem_14(*arguments)
    if arguments[-1].is_a?(Hash)
        args = arguments[0..-2]
        prob = (arguments[-1])[:problem]
    else
        args = arguments
        prob = :count_clumps
    end
    if prob == :same_ends
        same_ends(*args)
    elsif prob == :count_clumps
        count_clumps(*args)
    end
end

def same_ends(*args)
    return true if args[0] == 0
    args[1..args[0]] == args[-(args[0])..-1]
end

def count_clumps(*args)
    count = 0
    change = 1
    args.each_index {|i| 
        if args[i] == args[i+1] && change == 1
            count += 1
            change = 0
        elsif args[i] != args[i+1] && change == 0
            change = 1
        end }
    count
end
