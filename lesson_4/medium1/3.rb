class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Is changing the attr_reader to attr_accessor a problem?

# Yes, there is a problem with that since now we can change the `product_name` if we so desire. This is something that 
# is probably set in stone and we don't want to change it. So only providing it with a reader method would make more sense.
# In this case, we would write an attr_accessor for quantity, but only provide a reader for product_name.