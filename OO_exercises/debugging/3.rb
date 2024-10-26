class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other_degrees)
    latitude == other_degrees.latitude && longitude == other_degrees.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false
                                    
# In order to fix this code, you have to define a fake operator `==` for the `GeoLocation` class.
# This is because, when calling `location` getter method on `ada` and `grace`, it is getting and comparing custom
# objects on line 43. It is doing this instead of comparing the actual integer values that we want them to compare.
# So, on line 26 to 28, we define a `==` method for the class that compares to another object based on whether 
# or not the `latitude` and `longitude` values are the same for both objects.
# This allows us to compare the objects on 43 based on those values referenced to by the instance variables.

# A good thing to mention also would be that `==` for a custom object uses the version found in `BasicObject`,
# which only returns true if they are the same object exactly. So we have to define our own method with
# a value(s) to compare by.