=begin
  What is the bill? 200
  What is the tip percentage? 15

  The tip is $30.0
  The total is $230.0
=end

puts "What is the bill amount in dollars?"
bill_amount = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

def full_bill_in_dollars(tip_percentage, bill_amount)
  format("%#.2f", (bill_amount * (tip_percentage / 100 + 1)))
end

def tip_in_dollars(bill_amount, tip_percentage)
  format("%#.2f", (bill_amount * (tip_percentage / 100)))
end

puts "The tip is $#{tip_in_dollars(bill_amount, tip_percentage)}"
puts "The total is $#{full_bill_in_dollars(tip_percentage, bill_amount)}"
