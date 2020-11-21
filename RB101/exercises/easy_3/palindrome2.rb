require './palindrome'

def real_palindrome?(string)
  stripped_string = string.gsub(/\p{^Alnum}/, '').downcase
  palindrome?(stripped_string)
end

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
