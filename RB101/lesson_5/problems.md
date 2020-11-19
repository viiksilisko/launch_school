How would you order this array of number strings by descending numeric value?


`arr = ['10', '11', '9', '7', '8']`


books.sort do |a, b|
  a[:published].to_i <=> b[:published].to_i
end

`arr1[2][1][3]`
`arr2[1][:third][0]`
`arr3[2][:third][0][0]`
`hsh1['b'][1]`
`hsh2[:third].keys[0]`


`arr1[1][1] = 4`
`arr2[2] = 4`
`hsh1[:first][2][0] = 4`
`hsh2[['a']][:a][2] = 4`

ages = 0
munsters.each do |k,v| 
  ages += v['age'] if v['gender'] == 'male'
end

puts ages

munsters.each do |k, v|
  puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}}"
end

def vowel?(val)
  ['a', 'e', 'i', 'o'].include?(val)
end

hsh.each do |k,v|
  v.each do |value|
    arr = value.split('')
    arr.each {|val| puts val if vowel?(val)}
  end
end

arr.map {|val| val.sort.reverse}

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |value|
  value.each_key do |int|
    value[int] += 1
  end
end

arr.map do |item|
  item.select {|int| (int % 3) == 0}
end

hsh = {}

arr.each do |item|
  hsh.store(item[0], item[1])
end

array = []

hsh.each_pair do |k,v|
  if v[:type] == 'fruit'
    array << v[:colors].map {|v| v.capitalize}
  else
    array << v[:size].upcase
  end
end

arr2 = []

arr.each do |hash|
  if hash.values[0].all? {|v| v.even?}
    arr2 << hash
  end
end


def uuid
  str = ""
  str << Random.bytes(4).unpack1('H*')
  str << "-"
  str << Random.bytes(2).unpack1('H*')
  str << "-"
  str << Random.bytes(2).unpack1('H*')
  str << "-"
  str << Random.bytes(2).unpack1('H*')
  str << "-"
  str << Random.bytes(4).unpack1('H*')
end