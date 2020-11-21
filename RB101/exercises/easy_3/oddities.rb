def oddities(array)
  new_array = []
  array.each_with_index do |item, index|
    new_array << item unless index.odd?
  end
  new_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
