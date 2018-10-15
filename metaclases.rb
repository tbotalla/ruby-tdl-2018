# What we did here is we added a singleton method something to an object.
# The difference between class methods and singleton methods is that class methods
# are available to all instances of a class object while singleton methods are available only to that single instance.
example = "I'm a string object"

def example.something
  self.upcase
end

p example.something
# I'M A STRING OBJECT