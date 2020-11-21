```
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```

Ruby will fill arguments from left to right, and if the arguments passed do not match the arguments needed for the method, but there are default values, Ruby will use any of the default values to get to the required number of arguments.

The above will print:
`[4, 5, 3, 6]`