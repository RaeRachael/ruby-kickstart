# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase (num)
    ans = Hash.new()
    i=0
    while i<num
        i+=1
        if i%2==1
            ans[i]=[]
            x=2
            while x<i
                if x%2==0
                    ans[i] << x
                end
            x+=1
            end
        end
    end
    ans
end