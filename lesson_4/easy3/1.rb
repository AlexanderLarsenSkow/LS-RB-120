class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # => "Hello"

# hello finds hi in Hello class, which calls greet from the Greeting class with an argument of "Hello".

hello = Hello.new
hello.greet("Goodbye") # "Goodbye"

# greet outputs the string "Goodbye" since greet is in the method lookup path for the Hello class.

Hello.hi # error, not sure what kind. Can't call an instance method on a class. undefined method.


hello = Hello.new
hello.greet # no argument error. Ruby can't run the code because `greet` takes 1 argument, which it outputs.

hello = Hello.new
hello.bye # no method error. Ruby can't find the method because Hello doesn't inherit from Goodbye.

