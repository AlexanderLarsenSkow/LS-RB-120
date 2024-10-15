class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What happens below?

tv = Television.new # instantiating a new object from the Television class
tv.manufacturer # no method error since manufacturer is a class method
tv.model # code runs because model is an instance method for the Telvision class. It can be called on objects from Television.

Television.manufacturer # code runs since manufacturer is a class method
Television.model # code does not run because model is an instance method, not a class method.