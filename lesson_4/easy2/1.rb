# What is output here? 

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
p oracle.predict_the_future

# Outputting the result of `predict_the_future` on line 14 will output one of 3 strings: 
  # `"You will eat a nice lunch"`, `"You will take a nap soon"`, or `"You will stay at work late"`.
  # This is because `predict_the_future` uses string addition to add `"You will"` with `choices.sample`, which takes
  # a random value from the `choices` method's return value, which is an array of string values.
  