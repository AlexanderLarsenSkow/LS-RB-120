# Fix the Program: Mailable

# Make the smallest possible change to make sure all objects have access to #print_address

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  attr_reader :name, :address, :city, :state, :zipcode
  include Mailable
end

class Employee
  attr_accessor :name, :address, :city, :state, :zipcode
  include Mailable
end

# betty = Customer.new
bob = Employee.new
bob.name = 'Bob'
bob.address = '1111 North Drive Avenue'
bob.city = 'Denver'
bob.state = 'Colorado'
bob.zipcode = 22137

# betty.print_address
bob.print_address