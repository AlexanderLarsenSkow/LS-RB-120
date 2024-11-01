class Dog
	attr_reader :status
	
	def good_bad
		"#{status} dog!"
	end
	
	def initialize(status)
		@status = status
	end
end

dog = Dog.new('good')
dog2 = Dog.new('bad')

p dog.good_bad # => 'good dog!'
p dog2.good_bad # => 'bad dog!'
p Dog.good_bad # => NoMethodError