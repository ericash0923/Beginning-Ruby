require_relative "stacklike" ## need stacklike.rb

class Stack
  include Stacklike ##include the module into the class Stack
end

s = Stack.new       ## new stack object
s.add_to_stack("item one") ##add item
s.add_to_stack("item two")
s.add_to_stack("item three")
puts "Objects currently on the stack:"
puts s.stack
taken = s.take_from_stack ##remove item
puts "Removed this object:"
puts taken
puts "Now on stack:"
puts s.stack


## Nonmodular rewrite of the Stack Class
