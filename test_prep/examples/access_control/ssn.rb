class Person
	attr_reader :name

	def initialize(name, ssn)
		@name = name
		@ssn = ssn
	end

	def see_ssn
		"xxx-xx-#{ssn[-4..-1]}"
	end

	private

	attr_reader :ssn
end

dave = Person.new('Dave', '123456789')
p dave.see_ssn # => 'xxx-xx-6789'

p dave.ssn # => Private Method, NoMethodError