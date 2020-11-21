=begin
  Problem:
    Inputs:
      - a string

    Outputs:
      - a string

  Examples:
    reverse_sentence('') == ''
    reverse_sentence('Hello World') == 'World Hello'
    reverse_sentence('Reverse these words') == 'words these Reverse'

  Datastructures:
    - A string as an input
    - An array with the words in the input string separated
    - Back to a string

  Algorithm:
    - Take a string as an input
    - Separate the words based on whitespace ' ' and put them in an array
    - Reverse the order of the array
    - Join the words in the array back to a string
  Code:
=end

def reverse_sentence(sentence)
  sentence.split(' ').reverse.join(' ')
end

# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   reversed = []
#   words.each do |word|
#     reversed.unshift word
#   end
#   reversed.join(' ')
# end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
