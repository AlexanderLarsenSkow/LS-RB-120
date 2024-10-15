class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is right here. When we have a reader method for an instance variable, we do not have to directly call the 
# instance variable itself like `@balance`. We can instead call the getter, which provides a layer of abstraction. We do not 
# have to expose the instance variable itself. In this case, it works to just use the reader.
# Without the attr_reader for :balance on line 2, then Alyssa would be right.

