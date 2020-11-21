# puts "Enter the length in meters:"
# length = gets.chomp.to_f

# puts "Enter the width in meters:"
# width = gets.chomp.to_f

# square_meters = length * width
# square_feet = square_meters * 10.7639

# puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)" 
SQUARE_METERS_TO_FEET = 10.7639

puts "Enter the length in feet:"
length = gets.chomp.to_f

puts "Enter the width in feet:"
width = gets.chomp.to_f

square_feet = length * width
square_centimeters = (square_feet / SQUARE_METERS_TO_FEET) * 100 * 100

puts "The area of the room is #{square_feet} square feet (#{square_centimeters} square centimeters)" 