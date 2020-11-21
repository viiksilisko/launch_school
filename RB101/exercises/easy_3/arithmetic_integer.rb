puts "==> Enter the first number:"
first = gets.chomp.to_i

puts "==> Enter the second number:"
second = gets.chomp.to_i

def perform_calculations(first, second)
  puts "==> #{first} + #{second} = #{first + second}"
  puts "==> #{first} - #{second} = #{first - second}"
  puts "==> #{first} * #{second} = #{first * second}"
  puts "==> #{first} / #{second} = #{first / second}"
  puts "==> #{first} % #{second} = #{first % second}"
  puts "==> #{first} ** #{second} = #{first ** second}"
end

perform_calculations(first, second)