# Fix the Program: Persons

# Complete the program so it achieves the output below.

class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def first_name=(first_name)
    @first_name = first_name.capitalize
  end

  def last_name=(last_name)
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person #== 'John Doe'

person.first_name = 'jane'
person.last_name = 'smith'
puts person #== 'Jane Smith'

# John Doe
# Jane Smith