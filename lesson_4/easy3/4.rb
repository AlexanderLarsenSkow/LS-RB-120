# Use to_s to output something other than a weird object code when we invoke puts iwth the object as an argument.

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

puts Cat.new('tabby')