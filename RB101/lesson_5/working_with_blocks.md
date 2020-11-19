## Example 1

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

The `.each` iterates through the array of arrays, with each element being a nested array. So the first `arr` in the loop would be `[1, 2]`. Then it'll use the `Array#first`, that refers to the first item in the array, in the first iteration it would be `1`.


## Example 2

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

Since `map` always returns a new array with the result of the passed block, and `puts` return value is `nil`, the array returned will be `[nil, nil]`.


## Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

`=> [1, 3]`

 Line | Action | Object | Side Effect | Return Value | Is Return Value Used? 
--- | --- | --- | --- | --- | ---
1 | method call `map` | The outer array | none | New array `[1, 3]` | no
1-4 | block execution | each sub array | none | the first item in the sub array | Yes
2 and 3 | method call `first` | each sub array | none | the first element in the array | yes by `puts` as well as as the return value of the block
2 | method call `puts` | Element at index 0 of each sub array | outputs a string representation of an integer | `nil` | no


## Example 4

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

 Line | Action | Object | Side Effect | Return Value | Is Return Value Used? 
--- | --- | --- | --- | --- | ---
1 | method call `Array#=` | n/a | none | `[[18, 7], [3, 12]]` | no
1 | method call `each` |  `[[18, 7], [3, 12]]` | none | the original array | Yes, used by variable assignment to `my_arr`
1 - 7 | block execution | each sub array | no | each sub array | no
2 | method call `each` | `[18, 7]` and `[3, 12]` | none | the sub array | no
2 - 6 | block execution | each item in the sub array | none | `nil` | no
3 | `<` comparison | Element of the sub-array in that iteration | none | Boolean | Yes, evaluated by `if`
3 - 5 | conditional `if` | Element of the sub-array in that iteration | None | `nil` | Yes, used to determine return value of inner block
4 | method call `puts` | Element of the sub-array in that iteration | Outputs a string representation of an Integer | `nil` | Yes, used to determine return value of inner block


## Example 5

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

 Line | Action | Object | Side Effect | Return Value | Is Return Value Used? 
--- | --- | --- | --- | --- | ---
1 | `map` | `[[1, 2], [3, 4]]` | none | New array based on the return value of the block | Yes, to create a new array
1 - 5 | exection of the outer block | each sub array | none | modified item based on the block | yes, to transform the item in the original array
2 | `map` | `[1, 2]` and `[3, 4]` | none | New array based on block | yes, assign new array 
2 - 4 | inner block execution | each item in the sub array | none | new value based on logic | yes, to assign new value 
3 | `*` operator | number from the sub array | None | number multiplied by 2 | yes, to update the value in the sub array

return value will be `[[2, 4], [6, 8]]`

## Example 6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

 Line | Action | Object | Side Effect | Return Value | Is Return Value Used? 
--- | --- | --- | --- | --- | ---
1 | `select` | Array of hashes | none | new array | no
1 - 5 | block execution | each hash in the array | none | Boolean | Yes, to determine which elements to select
2 | `Enumerable#all?` | each hash in the original array | none | Boolean | Yes, the outer block uses it
2 - 4 | block execution | each key-value pair in each hash | none | Boolean | Yes, to be used to determine if all items in the hash evaluate to true
3 | comparison `==` | the value from the hash in that iteration | none | Boolean | Yes, for determining the result of `all?`


## Example 7

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
```


## Example 10 

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? 
--- | --- | --- | --- | --- | ---
1 | `map` | `[[[1,2], [3, 4]], [5,6]]` | none | a new array | no
1 - 11 | outer block execution | each element in the original array | none | a new array | yes, to create a new array
2 | `map` | each item in the origianl array | none | a new array | yes, to return in the outer block
2 - 10 | mid block execution | each item in the original array | none | a new array | yes to construct a new array
3 | comparison `==` | integer indicating the size of the element | none | boolean | yes, it's being used by the `if` statement
3 | conditional `if` | none | none | `nil` | yes to determine the control flow 
4 | `+` operator | element in that iteration from mid `map` | none | result of the operation | yes to transform the mid element
6 | `map` | the element from the mid block | none | transformed value | used to pass to the the mid `map`
6 - 8 | inner block execution | elements from the mid block | none | transformed values | passed to the mid `map`

`[[[2, 3], [4, 5]], [6, 7]]`

