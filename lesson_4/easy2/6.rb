class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# which one is a class method?

# `self.manufacturer` is a class method. We know because of the use of `self` as a prefix for the method name.
# This tells us that `self` is referencing the class itself, so the method is meant to be called on the class, not an object from 
# the class.

# Television.manufacturer