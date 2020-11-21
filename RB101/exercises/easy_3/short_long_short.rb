def short_long_short(s1, s2)
  short = s1.size < s2.size ? s1 : s2
  long = short == s1 ? s2 : s1
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
