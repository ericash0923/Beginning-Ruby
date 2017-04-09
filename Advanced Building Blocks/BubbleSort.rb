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
