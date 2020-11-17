## Problem 1

What is the return value of the select method below? Why?

```
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

`[1, 2, 3]` because `#select` returns a new Array with any element that returns a truthy value in the block. 'hi' is a truthy value.


## Problem 2

How does count treat the block's return value? How can we find out?

```
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

`#count` if given a block it will count all the values in the collection when the result of the block is truthy.


## Problem 3

What is the return value of reject in the following code? Why?

```
[1, 2, 3].reject do |num|
  puts num
end
```

`[1, 2, 3]`, because `.reject` will reject an item when the given block returns a truthy value. `puts` always returns `nil`, which is one of the two false values in Ruby.


## Problem 4


What is the return value of each_with_object in the following code? Why?

```
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

`{a: 'ant', b: 'bear', c: 'cat'}` Because `value` is each of the values in the original array, and using `[0]` on a string returns the char that equals to the index, in this case the first character. then the `Hash#=[]` method assigns the value to the given key.

## Problem 5

What does shift do in the following code? How can we find out?

```
hash = { a: 'ant', b: 'bear' }
hash.shift
```

`[:a, 'ant']` is the return value. `shift` takes the first key-value pair in the hash and assigns them to a 2 item array. It also mutates the original hash by removing that key-value pair from the hash.


## Problem 6

What is the return value of the following statement? Why?

`['ant', 'bear', 'caterpillar'].pop.size`

`11` because the value retruned by `#pop` is the last item in the Array, which is `'caterpillar'`, then `#size` returns the size of the string, which is 11 characters.

## Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

`true`, `#any?` returns a boolean value if any of the items in the collection return true based on the condition given in the block.

The return value of the block is `boolean`


## Problem 8

How does take work? Is it destructive? How can we find out?

```
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

`take` is not destructive. It takes `n` number of items from the collection based on the number passed in to the method.


## Problem 9

What is the return value of map in the following code? Why?

```
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

`[nil, 'bear']`


## Problem 10

What is the return value of the following code? Why?

```
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

`[1, nil, nil]`
