def add(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

def subtract(*numbers)
  current_result = numbers.shift
  numbers.inject(current_result) { |current_result, number| current_result - number }
end

def calculate(*arguments)
  # arguments is like an array
  # if the last argument is a Hash, extract it
  # otherwise create an empty Hash
  options = arguments[-1].is_a?(Hash) ? arguments.pop : {}
  ## default option is addition; add the value into options
  options[:add] = true if options.empty?
  return add(*arguments) if options[:add]
  return subtract(*arguments) if options[:subtract]
end


##
def add(a_number, another_number, options = {})
  sum = a_number + another_number
  sum = sum.abs if options[:absolute]
  sum = sum.round(options[:precision]) if options[:round]
  sum
end

puts add(1.0134, -5.568)
puts add(1.0134, -5.568, absolute: true)
puts add(1.0134, -5.568, absolute: true, round: true, precision: 2)

add(4, 5)
add(-10, 2, 3)
add(0, 0, 0, 0)
subtract(4, 5)
subtract(-10, 2, 3)
subtract(0, 0, 0, 0, -10)
##defaults to addtion when no option is specified
calculate(4, 5, add: true)
calculate(-10, 2, 3, add: true)
calculate(0, 0, 0, 0, add: true)
calculate(4, 5, subtract: true)
calculate(-10, 2, 3, subtract: true)
calculate(0, 0, 0, 0, -10, subtract: true)
