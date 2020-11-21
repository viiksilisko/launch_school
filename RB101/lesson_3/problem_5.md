## Q1
What do you expect to happen when the greeting variable is referenced in the last line of the code below?

```
if false
  greeting = “hello world”
end

greeting
```

### A
~~`NameError`~~

Answer: Even when an if-block doesn't execute a variable defined in it is initialized to `nil`

## Q2

What is the result of the last line in the code below?

```
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
### A

It'll output 

`{ a: 'hi there' }`, since both greetings[:a] and informal_greeting are referencing the same string, and when we add destrucively to `informal_greeting` it changes the referenced string.

>we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.

## Q3

What will be printed by each of these code groups?

A)

```
def mess_with_vars(one, two, three)
  puts one.object_id
  one = two
  puts one.object_id
  two = three
  three = one
end

one = "one"
puts one.object_id
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" 
puts "two is: #{two}"
puts "three is: #{three}"
```
One is one
two is two
three is three

B)

```
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
One is one
two is two
three is three

C)

```
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

one is two
two is three
three is one

Because the method uses `gsub!`, which is a destructive method and mutates the original referenced object.

## Q4

Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

```
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

