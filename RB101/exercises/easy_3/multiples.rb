def multisum(num)
  array = []
  1.upto(num) { |number| array << number if number % 3 == 0 || number % 5 == 0 }
  array.sum
end

puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(3) == 3
puts multisum(1000) == 234168
