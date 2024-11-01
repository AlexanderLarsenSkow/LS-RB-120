class Person
	def initialize(name)
		@name = name
	end

	def meet(other)
		"Hey #{other.name}! My name is #{name}."
	end

	protected

	attr_reader :name
end

bob = Person.new('Bob')
joe = Person.new('Joe')

p bob.meet(joe) # => "Hey Joe! My name is Bob."
p bob.name # => ProtectedMethodError