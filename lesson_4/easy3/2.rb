class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi
# If we want to run Hello.hi, we can define `hi` as a class method with `self` as a prefix.
# That way, it can be called on the class itself, rather than an instantiated object from the class.

# We also have to define `greet` in the Greeting class as a class method, in order to call it on the Hello class.