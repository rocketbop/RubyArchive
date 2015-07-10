
def show_regexp(string, pattern)
  match = pattern.match(string)

  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"
  else
    "no match"
  end
end

puts (show_regexp 'very insterestring', /t/)
puts (show_regexp 'Fats Waller', /lle/)
puts (show_regexp 'Fats Waller', /z/)

# regular option test

puts "regular expression tests"
puts (show_regexp 'über.', /(?a)\w+/)
puts (show_regexp 'über.', /(?u)\w+/)

puts (show_regexp "über.", /(?d)\W+/)
puts (show_regexp "über.", /(?u)\W+/)

# use name to stand for character set
puts "\nUse name to stand for character set"

puts (show_regexp 'Price $12', /[aeiou]/)
puts (show_regexp 'Price $12', /[[:digit:]]/)
puts (show_regexp 'Price $12', /[[:space:]]/)
puts (show_regexp 'Price $12', /[[:^alpha:]]/)
puts (show_regexp 'Price $12', /[[:punct:]aeiou]/)

# test capture group

puts "\nNow test capture group"

/(\d\d):(\d\d)(..)/ =~ "12:50am"
puts "Hour is #$1, minute #$2"

/((\d\d):(\d\d))(..)/ =~ "12:50am"
puts "Time is #$1"
puts "Hour is #$2, minute #$3"
puts "AM/PM is #$4"

puts "\n use MatchData test capture group"

md = /(\d\d):(\d\d)(..)/.match("12:50am")
puts "Hour is #{md[1]}, minute #{md[2]}"

md = /((\d\d):(\d\d))(..)/.match("12:50am")
puts "Time is #{md[1]}"
puts "Hour is #{md[2]}, minute #{md[3]}"
puts "AM/PM is #{md[4]}"


puts "\n test repetion"
puts (show_regexp 'He said "Hello"', /(\w)\1/)
puts (show_regexp 'Mississippi', /(\w+)\1/)

