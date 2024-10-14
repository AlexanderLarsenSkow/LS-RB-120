# Which method creates an instance variable?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Only the `initialize` method in the `Pizza` class creates a new instance variable.
# We know because in the method definition from lines 10 to 12, is written `@name = name`.
# The @ symbol tells us that this is an instance variable and that it is being initialized in the method.
# The `initialize` method in `Fruit` does not initialize an instance variable because it writes:
  # `name = name`. This just creates and returns a new local variable, rather than an instance variable.

  # instance_variables method returns an array of all instance variables

  p Pizza.new('P').instance_variables # => [:@name]
  p Fruit.new('F').instance_variables # => []
  
  