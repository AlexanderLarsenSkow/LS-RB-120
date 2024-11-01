module Outputtable
  def to_s
    "My name is #{@name} and I'm a #{@job}!"
  end
end

class Person
  # attr_reader :name, :job
  include Outputtable

  def initialize(name, job)
    @name = name
    @job = job
  end
end

roger = Person.new("Roger", "Carpenter")
puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method.

# make Person subclass from another class
# or mix in a module without defining reader methods.


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"