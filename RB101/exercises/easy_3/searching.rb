=begin
  Problem:
    Inputs:
      - 6 integers

    Outputs:
      - the last integer given
      - first 5 given integers in an Array
      - A string describing the output

    The program asks the user to input 6 integers.
    It then checks if the 6th integer is already present in the first 5 integers,
    and displays the results based on whether the 6th one appeared already or not.

  Examples:
    ==> Enter the 1st number:
    25
    ==> Enter the 2nd number:
    15
    ==> Enter the 3rd number:
    20
    ==> Enter the 4th number:
    17
    ==> Enter the 5th number:
    23
    ==> Enter the last number:
    17
    The number 17 appears in [25, 15, 20, 17, 23].

    ==> Enter the 1st number:
    25
    ==> Enter the 2nd number:
    15
    ==> Enter the 3rd number:
    20
    ==> Enter the 4th number:
    17
    ==> Enter the 5th number:
    23
    ==> Enter the last number:
    18
    The number 18 does not appear in [25, 15, 20, 17, 23].
  
    Datastructure:
      - Integers for user inputs
      - An Array to store the first 5 input integers

    Algorithm:
      - 5 times
        - ask for an integer from the user
        - capture the input
        - store the input in an array of integers
      - ask for the last integer and store it in a variable
      - check if the Array includes the last integer
      - Print an output to the user depending on the previous step
=end

def nth(number)
  case number
  when 1
    '1st'
  when 2
    '2nd'
  when 3
    '3rd'
  when 4
    "4th"
  when 5
    "5th"
  when 6
    'last'
  else
    ''
  end
end

def get_numbers
  numbers = []
  6.times do |num|
    puts "Enter the #{nth(num + 1)} number:"
    numbers << gets.chomp.to_i
  end
  numbers
end

def display_result(numbers)
  first_five = numbers.first(5)
  last = numbers.last
  if first_five.include?(last)
    puts "The number #{last} appears in #{first_five}."
  else
    puts "The number #{last} does not appear in #{first_five}."
  end
end

display_result(get_numbers)
