## Question 1 

## Q
What would you expect the code below to print out?

```
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

### A

_The `puts` will output the original array `[1, 2, 2, 3]`, since uniq is non-destructive and won't mutate the original object. If it would be reassigned `numbers = numbers.uniq` then the result woudl be `[1, 2, 3]`_

### Correct answer
The actual output would be
```
1
2
2
3
```
the `p` method automatically calls `inspect` on its arguments, which gives a different format in the output.


## Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
- the bang operator `!` in a method name signals that the method is "destructive", which means that it will mutate the calling object. For exmple `Array#uniq!` mutates the calling Array, whereas `Array#uniq` returns a new Array object.
- `!` prepended to an Object also acts as a `Boolean negate`, basically flipping the thruthiness value of the object.
- `?` in a method name signals that the method should return a boolean value.
- `?` is also used in ternary operations: `a ? b : c`

1. what is != and where should you use it?
   1. In a conditional statement. `!=` checks whether two calues on both sides of the operator are _NOT_ equal. Opposite of `==`
2. put ! before something, like !user_name
   1. Boolean negate, returns `true` for `nil` or `false`, `false` for any other object
3. put ! after something, like words.uniq!
   1. Signals that the method mutates the calling object.
4. put ? before something
   1. Looks like in earlier Ruby versions it could be used to return the ASCII integer for a character. In Ruby 2.7.2 it returns a stringifyed version of any one character.
5. put ? after something
   1. Signals that a method should return a boolean value
6. put !! before something, like !!user_name
   1. Double boolean negate, basically returns the thruthiness of the object.

## Question 3

### Q
Replace the word "important" with "urgent" in this string:

Copy Code
`advice = "Few things in life are as important as house training your pet dinosaur."`

### A
`advice.gsub!('important', 'urgent')`

## Question 4

### Q
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

`numbers = [1, 2, 3, 4, 5]`

What do the following method calls do (assume we reset numbers to the original array between method calls)?

```
numbers.delete_at(1)
numbers.delete(1)
```

### A
`Array#delete_at` deletes the item in the array at the given index.
`Array#delete` deletes the matching item in the array if found.

>>>Another thing to notice is that while both of these methods operate on the contents of the referenced array and modify it in place (rather than just returning a modified version of the array) these methods do NOT have the usual `!` at the end of the method name for "modify in place" method names.

## Question 5

### Q
Programmatically determine if 42 lies between 10 and 100.

### A
`(10..100).include?(42)`

## Question 6

### Q
Starting with the string:

`famous_words = "seven years ago..."`

show two different ways to put the expected "Four score and " in front of it.

### A
`famous_words = "Four score and " + famous_words`
`famous_words.insert(0, 'Four score and ')`

## Question 7

### Q
If we build an array like this:

```
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```

We will end up with this "nested" array:


`["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]`
Make this into an un-nested array.

### A
`flintstones.flatten!`

## Question 8

### Q
Given the hash below

`flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }`

Turn this into an array containing only two elements: Barney's name and Barney's number

### A
`flintstones.assoc('Barney')`
