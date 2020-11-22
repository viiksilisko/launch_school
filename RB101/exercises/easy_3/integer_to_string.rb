DIGITS = {
  0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"
}

def integer_to_string(int)
  int.digits.reverse.map { |digit| DIGITS[digit] }.join
end

def signed_integer_to_string(int)
  if int > 0
    int.digits.reverse.map { |digit| DIGITS[digit] }.join
    "+#{int}"
  elsif int < 0
    pos_int = -int
    pos_int.digits.reverse.map { |digit| DIGITS[digit] }.join
    "-#{pos_int}"
  else
    '0'
  end
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
