def bubble_sort(array)
    n = array.length
    while n > 1
        (n-1).times do |i|
            array[i], array[i+1] = array[i+1], array[i] if array[i] > array[i+1]
        end
        n = n - 1
    end
    array 
end

p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def bubble_sort_by(array)
    n = array.length
    while n > 1
        (n-1).times do |i|
            array[i], array[i+1] = array[i+1], array[i] if yield(array[i], array[i+1]) > 0
        end
        n = n - 1
    end
    array 
end

sorted_a = bubble_sort_by(["hi","hello","hey"]) do |left, right|
    left.length - right.length
end
p sorted_a
# => ["hi", "hey", "hello"]
