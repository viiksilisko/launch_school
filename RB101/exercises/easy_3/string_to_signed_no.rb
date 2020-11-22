require './string_to_i'

def string_to_signed_integer(input)
  result = 0
  if input.chars.first == '-'
    result = - + string_to_integer(input.delete('-'))
  elsif input.chars.first == '+'
    result = string_to_integer(input.delete('+'))
  else
    result = string_to_integer(input)
  end
  result
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
