def running_total(array)
  new_array = []
  array.each_with_index { |item, i| new_array << array.first(i).sum + item }
  new_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
