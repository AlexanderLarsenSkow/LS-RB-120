# Fix teh class so it is resistant to future problems.
# There is nothing wrong; but there is a design flaw.

class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

