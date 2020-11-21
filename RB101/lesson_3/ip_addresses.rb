def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_words.all? { |word| is_an_ip_number?(word) } &&
    dot_separated_words.length == 5
end

input_string = "255.255.255.255"
dot_separated_words = ["255", "255", "255", "255"]
