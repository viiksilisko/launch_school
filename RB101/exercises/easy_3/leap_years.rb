=begin
  Problem:
    inputs:
      - Year
    outputs:
      - Whether the given year is a leap year or not.

    Leap year occurs every year that's divisible by 4, unless the year is also divisible by 100.
    If the year is evenly divisible by 100, it's not a leap year unless the year is divisible by 400.
  
  Examples:
    leap_year?(2016) == true
    leap_year?(2015) == false
    leap_year?(2100) == false
    leap_year?(2400) == true
    leap_year?(240000) == true
    leap_year?(240001) == false
    leap_year?(2000) == true
    leap_year?(1900) == false
    leap_year?(1752) == true
    leap_year?(1700) == false
    leap_year?(1) == false
    leap_year?(100) == false
    leap_year?(400) == true

  Data structures:
    - Year for input
    - Boolean as the output

  Algorithm:
    - Assign each div to their own variables: div_by_four, div_by_100, div_by_400
      - the given year divided by 4, 100, 400 == 0
    - Check that the year is dividable by 4, and is either not dividable by 100,
      or is both dividable by 100 AND 400.
    - Return the result of the above conditional
=end

def leap_year?(year)
  div_by_four = year % 4 == 0
  div_by_100 = year % 100 == 0
  div_by_400 = year % 400 == 0

  if year >= 1752
    div_by_four && ((div_by_100 && div_by_400) || !div_by_100)
  else
    div_by_four
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
