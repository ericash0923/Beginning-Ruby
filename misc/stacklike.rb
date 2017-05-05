module Stacklike
  ## ||= (or-equals) operator set empty array if and only if the variable isnt
  ## already set to something other than nil
  def stack
    @stack ||= []
  end
  def add_to_stack (obj)
    stack.push(obj)
  end
  def take_from_stack
    stack.pop
  end
end
