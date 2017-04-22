def length_finder(input_array)
  input_array.map  {|x| x.length.to_i}
end

length_finder(['Ruby','Rails','C42'])

def find_frequency(sentence, word)
  sentence.downcase.split(' ').count(word.downcase)
end

find_frequency("Ruby is The best language in the World", "the")

# The spaceship (<=>) method can be used to compare two strings
# The <=> method returns 0 if the strings are identical,
# -1 if the left hand string is less than the right hand string,
# and 1 if it is greater:

def sort_string(string)
  string.split(' ').sort {|x,y| x.length <=> y.length }.join(' ')
end

sort_string("Awesome I am")

## first attempt
# def random_select(array, n)
#   random_array = Array.new
#   (0...n).each do |x|
#     random = rand(array.length)
#     random_array.push(array[random])
#   end
#   random_array
# end

# cleaner way; use #times for regular loop
def random_select(array, n)
  random_arr = Array.new
  n.times do
    random_array << array[rand(array.length)]
  end
end

random_select([1, 2, 3, 4, 5], 3)

##################################################################

candidate.years_of_experience = 4
  candidate.github_points = 293
  candidate.languages_worked_with = ['C', 'Ruby', 'Python', 'Clojure']
  candidate.applied_recently? = false
  candidate.age = 26

is_an_experienced_programmer = # Fill your expression here
(candidate.languages_worked_with.include? "Ruby")
&& (candidate.applied_recently? != true) &&
(candidate.years_of_experience >= 2 ||
candidate.github_points >= 500) && candidate.age >= 15


##################
# Palindromes
##################

def palindrome?(sentence)
  down_stripped_sentnece = sentence.gsub(" ","").downcase
  down_stripped_sentnece == down_stripped_sentnece.reverse
end

palindrome?('Race fast safe car')
palindrome?('Live not on Evil')
palindrome?('Yreka Bakey')

######################################
# Compute sum of cubes for given range
######################################

# 1st way
# def sum_of_cubes(a, b)
#   sum = 0
#   ((b-a)+ 1).times do
#     sum += a**3
#     a += 1
#   end
#   sum
# end

## 2nd way
def sum_of_cubes(a, b)
  (a..b).inject(0) {|sum, x| sum + x*x*x}
end

sum_of_cubes(1,3)
sum_of_cubes(3,5)

######################################
# Find non-duplicate values in an Array
######################################

def non_duplicated_values(values)
  values.each do |x|
    values.delete(x) if values.count(x) == 2
  end
end

non_duplicated_values([1,2,2,3,3,4,5])
non_duplicated_values([1,2,2,3,4,4])

# def non_duplicated_values(values)
# find values with count only equal to 1 remove any copys
#   values.find_all { |x| values.count(x) == 1 }
# end

############################################
Check if all elements in an array are Fixnum
############################################
# def array_of_fixnums?(array)
# array.each do |x|
#   if x.class != Fixnum
#     return false
#   else
#     true
#   end
# end

def array_of_fixnums?(array)
  array.all? { |x| x.is_a? Fixnum }
end

array_of_fixnums([1,2,3])
array_of_fixnums(['a',2,'b'])


############################################
## Kaprekar's Number
############################################

# Kaprekar number k with n-digits, if you square it and add the
# right n digits to the left n or n-1 digits, the resultant sum is k

def kaprekar?(k)
  # k was convert to string to use the array properties
  num_length = k.to_s.size
  square = (k ** 2).to_s

  second_half = square[-num_length..-1]
  #if number is even n-1; odd number n-2
  first_half = square.size.even? ? square[0..no_of_digits-1] : square[0..no_of_digits-2]

  # must convert all number back to integer since it was convert
  # to string
  k == first_half.to_i + second_half.to_i
end

kaprekar?(9)
kaprekar?(55)
kaprekar?(297)
kaprekar?(703)

############################################
Enough Contrast?
############################################

class Color
  attr_reader :r, :g, :b
  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
  end

  def brightness_index
    (r*299 + g*587 + b*114) / 1000
  end

  ## Absolute difference in brighness indices
  def brightness_difference(another_color)
    ##two object -- 2 colors
    (brightness_index - another_color.brightness_index).abs
  end


  def hue_difference(another_color)
    #|R1 - R2| + |G1 - G2| + |B1 - B2|
    (r - another_color.r).abs +
    (g - another_color.g).abs +
    (b - another_color.b).abs
  end

  ## Brightness difference is more than 125 and the Hue difference
  ## is more than 500 then the colors have sufficient contrast
  def enough_contrast?(another_color)
    brightness_difference(another_color) > 125 &&
    hue_difference(another_color) > 500
  end
end
