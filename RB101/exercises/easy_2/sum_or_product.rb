def calculate_sum(num)
  (1..num).inject(:+)
end

def calculate_product(num)
  (1..num).inject(:*)
end

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts ">> Enter 's' to compute sum, 'p' to compute the product."
choice = gets.chomp

if choice.downcase == 's'
  puts calculate_sum(number)
elsif choice.downcase == 'p'
  puts calculate_product(number)
else
  puts "Not a valid input"
end
