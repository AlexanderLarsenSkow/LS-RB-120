# What is the mistake in the code?

class InvoiceEntry
  attr_reader :quantity, :product_name
  attr_writer :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

# We need to write self.quantity = updated_count if...

# This is because Ruby will think that quantity as written on line 14 will just be a new local variable
# defined in the local scope of hte method definition for update_quantity.
 # To fix it, we prepend `self` to quantity: self.quantity = which calls a writer method and changes the
 # value of hte instance variable to the passed in argument for the method.

 # We also need to include a writer method for this code to work, so we write that on line 5.

 a = InvoiceEntry.new('pillowpet', 2)
 p a.quantity
 a.update_quantity(3)
 p a.quantity