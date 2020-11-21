def reverse_words(sentence)
  sentence.split.map { |el| el.length >= 5 ? el.reverse : el }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
