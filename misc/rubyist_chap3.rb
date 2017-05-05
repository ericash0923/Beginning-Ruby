### Define a class

class Ticket
  def event
    "Can't really be specified yet..."
  end
end

#create a new object with Ticket method
ticket = Ticket.new
#method call ticket.event execution
puts ticket.event


## Listing 3.1
## An instance variable maintaining its value between method calls

class Person
  def set_name(string)
    puts "Setting person's name...."
    @name = string
  end

## instance variable start with @
  def get_name
    puts "Returning the person's name..."
    @name
  end
end

# create Person object to joe
joe = Person.new
# Setting his name
joe.set_name("Joe")
# Retrieve the person name
puts joe.get_name

## Initializing an object with state

## see the message "Creating a new ticket!" every time you create a new ticket
## object by calling Ticket.new.
class Ticket
  def initialize
    puts "Creating a new ticket"
  end
end

Ticket.new

#### Dynamically set vaules
class Ticket
  ## have access to the venue and date information and store by instance variables
  def initialize (venue,date)
    @venue = venue
    @date = date
  end

  ## read back venue
  def venue
    @venue
  end

  ## read back date
  def date
    @date
  end
end

th = Ticket.new("Town Hall", "11/12/13")
cc = Ticket.new("Convention Center", "12/13/14")
puts "We've created two tickets"
puts "The first is for a #{th.venue} event on #{th.date}"
puts "The second is for a #{cc.venue} event on #{cc.date}"

# We've created two tickets
# The first is for a Town Hall event on 11/12/13
# The second is for a Convention Center event on 12/13/14

##### 3.3 Setter methoods

class Ticket
  ## have access to the venue and date information and store by instance variables
  def initialize (venue,date)
    @venue = venue
    @date = date
  end

  ## allow us to set or reset the price of an existing ticket
  ## setter method
  def set_price (amount)
    @price = amount
  end

  ## read back venue
  def venue
    @venue
  end

  ## read back date
  def date
    @date
  end

  def price
    @price
  end
end

ticket = Ticket.new("Town Hall", "11/12/13")
ticket.set_price(63.00)
puts "The ticket cost $#{"%.2f" % ticket.price}."  ## Format price to two decimal places
ticket.set_price(72.50)
puts "Whoops -- it just went up. It now costs $#{"%.2f" % ticket.price}."


### Attributes and the attr_* method family

## More compact version

class Ticket
  attr_reader :venue, :date, :price
  attr_writer :price
  def initialize (venue,date)
    @venue = venue
    @date = date
  end
end

## Long Version

class Ticket
  def initialize (venue,date)
    @venue = venue
    @date = date
  end

  ## allow us to set or reset the price of an existing ticket
  ## setter method (writer)
  def price=(price)
    @price = price
  end

  ## read back venue (reader)
  def venue
    @venue
  end

  ## read back date (reader)
  def date
    @date
  end

  ## read back price (reader)
  def price
    @price
  end
end

## CREATING READER/WRITER ATTRIBUTES WITH ATTR_ACCESSOR

class Ticket
  attr_reader :venue, :date
  attr_accessor :price ##combine attr_reader and attr_writer
  def initialize (venue,date)
    @venue = venue
    @date = date
  end
end

## Inheritance and the Ruby class hierarchy

class C
end

class D < C
end

puts D.superclass
puts D.superclass.superclass

### Output
### C
### Object
### C is D's superclass and Object is C's superclass

### #3.6.3 A singleton method by any other name…

class Ticket
  attr_reader :venue, :date
  attr_accessor :price ##combine attr_reader and attr_writer
  def initialize (venue,date)
    @venue = venue
    @date = date
  end

  def Ticket.most_expensive(*tickets)
    tickets.max_by(&:price)
  end

end

## method most_expensive is defined directly on the class object Ticket, in singleton-method style
## Message most_expensive goes to the class Ticket, not to a particular ticket

th = Ticket.new("Town Hall","11/12/13")
cc = Ticket.new("Convention Center","12/13/14/")
fg = Ticket.new("Fairgrounds", "13/14/15/")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = Ticket.most_expensive(th,cc,fg)
puts "The highest-priced ticket is the one for #{highest.venue}."

## Output
## The highest-priced ticket is the one for Fairgrounds.


### #3.6.4 When, and why, to write a class method
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
  def Temperature.f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

puts Temperature.c2f(100)

## practically speaking, having a Temperature class with class
## methods to perform the conversions is adequate and is an acceptable design


## A note on method notation
## Some example
## Ticket#price ---> instance method price in the class Ticket
## Ticket.most_expensive ---> class method
## Ticket::most_expensive ---> class method


## 3.7.1 Basic use of constants

## Every constant begins with a capital letters
## constant def. on top of a class definition

class Ticket
  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"] ##---constant

  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end
    @date = date
  end
end

## will work
test = Ticket.new("Convention Center", 1/11)
## not work Unknown venue
test1 = Ticket.new("Center", 1/11)

## print all constant
puts Ticket::VENUES   ## using double colon(::)

## Adding to VENUES array
venues = Ticket::VENUES
venues << "High School Gym"
