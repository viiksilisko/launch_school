=begin
  Problem:
    inputs:
      - an integer
    outputs:
      - a string

    rules:
      - explicit:
        - return a string of alternating 1 and 0 for a total length of the given integer
        - Always start with 1
    
    questions:
      - how to handle non-integer values?
      - how to handle '0' as an input?

  Examples:
    puts stringy(6) == '101010'
    puts stringy(9) == '101010101'
    puts stringy(4) == '1010'
    puts stringy(7) == '1010101'

  Data structures:
  Algorithm:
    - Loop the number of times the input integer indicates
    - In each loop, append to a string with the result of modulus for that loop number
    - return string
  Code:
=end

def stringy(length, start = 1)
  result = ''
  length.times do |number|
    number += 1 unless start == 0
    result << (number % 2).to_s
  end
  result
end

puts stringy(6) == '101010'
puts stringy(9, 0) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
