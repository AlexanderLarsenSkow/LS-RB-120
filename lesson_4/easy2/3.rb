# How do you find where Ruby will look for a method and what that method is called? How do you show an object's ancestors?

# You can see where Ruby will look for a method by checking the `ancestors` method on the class of the object.
# In essence, Ruby will go up the Method Lookup Path until it finds a method listed in one of the classes that your class inherits from.
# The first time it finds a method that matches the method call, it will call that method.

# I can call an object's ancestors by calling the #class method on it, getting its class, and calling `ancestors` on that method call.

puts [1].class.ancestors

# What is the lookup chain for `Orange` and `HotSauce`?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p HotSauce.ancestors # => HotSauce Taste Object Kernel BasicObject
# same for Orange
