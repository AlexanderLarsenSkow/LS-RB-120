 # Simplify the class by removing two methods from it. Make sure to add something to it.
 # Maintain same functionality.

class BeesWax
  attr_accessor :type
  
  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# Adding attr_accessor method for the `@type` instance variable accomplishes the task. This creates a getter and setter for 
# the instance variable.

