class Dog
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def introduce
		puts "My name is #{name}!"
	end
end

davey = Dog.new('Davey')
joey = Dog.new('Joey')

davey.introduce # My name is Davey
joey.introduce # My name is Joey