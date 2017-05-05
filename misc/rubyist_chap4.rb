## Chap 4

##  Class is a subclass of Module class, so every class is also a module class

## 4.1 4.1 Basics of module creation and use

module MyFirstModule
  def say_hello
    puts "Hello"
  end
end

## Since module dont have instance like class; Instead modules get mixed in to
## class, using either the (include or prepend)
class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new ## create instance of the class
mt.say_hello
mt::say_hello

## Mixing in a module bears a strong resemblance to inheriting from a superclass
## main difference between inheriting from a class and mixing in a module is
## that you can mix in more than one module. No class can inherit from more
## than one class

## Modules open up lots of possibilities—particularly for sharing code among more
## than one class, because any number of classes can mix in the same module. We’ll look
## next at some further examples, and you’ll get a sense of the possibilities.

## 4.1.1 A module encapsulating “stacklikeness”
