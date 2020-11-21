def palindrome?(string)
  reverse = -1
  result = false
  string.size.times do |index|
    result = string[index] == string[reverse]
    break unless result
    reverse -= 1
  end
  result
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1, 2, 3, 2, 1]) == true
puts palindrome?([1, 3, 5, 6, 7]) == false
