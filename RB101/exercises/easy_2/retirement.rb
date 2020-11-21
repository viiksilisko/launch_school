=begin 
  What is your age? 30
  At what age would you like to retire? 70

  It's 2016. You will retire in 2056.
  You have only 40 years of work to go!
=end
require 'date'

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

year = Date.today.year
retirement_year = year + (retirement_age - age)

puts "It's #{year}. You will retire in #{retirement_year}. You have only #{retirement_year - year} years to go!"