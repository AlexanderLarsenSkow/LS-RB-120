class Dog
	attr_reader :name
	
	initialize(name)
		@name = name
	end
end

davey = Dog.new('Davey')
joey = Dog.new('Joey')

p davey.name # 'Davey'
p joey.name # 'Joey'