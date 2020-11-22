DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

HEX = {
  "1" =>	1, "2" =>	2, "3" =>	3, "4" =>	4, "5" =>	5,
  "6" =>	6, "7" =>	7, "8" =>	8, "9" =>	9, "A" =>	10,
  "B" =>	11, "C" =>	12, "D" =>	13, "E" =>	14,
  "F" =>	15
}

def string_to_integer(input)
  new = 0
  input.chars.each do |char|
    new = new * 10 + DIGITS[char]
  end
  new
end

def hexadecimal_to_integer(input)
  decimal = 0
  input.chars.reverse.each_with_index do |char, index|
    decimal += HEX[char.upcase] * (16**index)
  end
  decimal
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts hexadecimal_to_integer('4D9f') == 19871
