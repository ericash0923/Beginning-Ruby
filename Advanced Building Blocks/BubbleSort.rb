def bubbleSort (arr)
  begin
    swap = false
    (1..arr.length - 1).each do |i|
      first, second = arr[i-1], arr[i]
      arr[i-1], arr[i], swap = second, first, true if arr[i-1] > arr[i]
    end
  end while swap == true
  arr
end

bubbleSort([5,1,4,2,8])


def bubble_sort_by (arr)
  begin
    swap = false
    (1..arr.length - 1).each do |i|
      #yeild add the block into the methoods
      if yield(arr[i-1],arr[i]) > 0
      first, second = arr[i-1], arr[i]
      arr[i-1], arr[i], swap = second, first, true if arr[i-1] > arr[i]
    end
    end
  end while swap == true
  arr
end

# # bubbleSort([4,3,78,2,0,2])


bubble_sort_by(["hi", "hey", "hello"]) do |left,right|
  puts left.length - right.length
 left.length - right.length
end
