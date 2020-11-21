require './multiply'

def square(num)
  multiply(num, num)
end

def power_to_the(num, power)
  return 0 if power == 0
  return num if power == 1
  multiply(num, power_to_the(num, power - 1))
end

puts "square(5) ==> #{square(5)}"
puts "square(-3) ==> #{square(-3)}"
puts "square(15) ==> #{square(15)}"

puts "power_to_the(3, 3) ==> 27 == #{power_to_the(3,3)}"
puts "power_to_the(3, 4) ==> 81 == #{power_to_the(3,4)}"
puts "power_to_the(4, 5) ==> 1024 == #{power_to_the(4,5)}"
