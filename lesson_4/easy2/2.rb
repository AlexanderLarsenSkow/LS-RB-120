# What is the output of this code?

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

# This problem is very similar to the last problem. In this case, `choices` is overridden inside the `RoadTrip` class.
# This array has different strings that correspond with road trips and traveling. Rather than output one of the same strings as 
# before, when Ruby finds `predict_the_future`, it first looks for a `choices` method definition inside `RoadTrip`. When it finds
# this instance method, it runs it. It never runs the `choices` method written inside `Oracle`.


