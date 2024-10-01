# class Person
#   attr_accessor :last_name, :first_name

#   def initialize(name)
#     parse_full_name(name)
#   end

#   def name
#     "#{first_name} #{last_name.strip}"
#   end

#   def name=(name)
#     parse_full_name(name)
#   end

#   private

#   def parse_full_name(full_name)
#     words = full_name.split
#     @name = full_name
#     self.first_name = words.first
#     self.last_name = words.size > 1 ? words.last : ''
#   end

# end

# What is the output of this code?

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob.name}" # => "The person's name is: Person and code numbers


# Add a to_s method to the class

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name.strip}"
  end

  def name=(name)
    parse_full_name(name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    words = full_name.split
    @name = full_name
    self.first_name = words.first
    self.last_name = words.size > 1 ? words.last : ''
  end

end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# With the to_s method, which returns the name instance variable, we get:
  # "The person's name is: Robert Smith"