=begin
  Problem:
    Given an array, count together all the occurrences of an item in the array.

    requirements:
      implicit:
        - The array consists of strings
      explicit:
        - The words in the array are case sensitive 'suv' != 'SUV'

    inputs:
      - An Array of strings
      
    outputs:
      - printed output of each unique word with the number of occurrences next to them.

    questions:
      - Should non-string values be allowed?


    Examples:
      vehicles = [
        'car', 'car', 'truck', 'car', 'SUV', 'truck',
        'motorcycle', 'motorcycle', 'car', 'truck'
      ]

      car => 4
      truck => 3
      motorcycle => 2
      SUV => 1


    Data structure:
      An Array as an input 
      A Hash with words from the Array as keys and occurrences of those words as values.

    Algorithm:
      - create an empty hash called `occurrences`
      - Take unique words from the array and add them to `occurrences` hash
      - Count the number of occurrences for each word and add them under corresponding key in the hash
      - print out each key-value pair in the hash
=end

def count_occurrences(vehicles)
  vehicles.tally.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
