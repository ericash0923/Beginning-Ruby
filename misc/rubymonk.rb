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
