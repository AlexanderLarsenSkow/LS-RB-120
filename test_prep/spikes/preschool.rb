# Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers.
# Both teachers and assistants can help a student with schoolwork and watch
# them on the playground. A teacher teaches and an assistant helps kids with any bathroom emergencies.
# Kids themselves can learn and play. A teacher and principle can supervise a class.
# Only the principle has the ability to expel a kid. Janitors have the ability to clean.
# Cafeteria workers have the ability to serve food. Children, teachers, class assistants, principles, janitors and cafeteria workers
# all have the ability to eat lunch.

# Notes:
# nouns: children, teachers, class assistants, principle, janitors, cafeteria workers.

# teachers and assistants
  # help children with work # helpable

# kids learn and play
# teachers and principals can supervise class # module
# principals can expel
# janitors clean
# cafeteria workers serve food
# all have the ability to eat lunch MODULE

module Eatable
  def eat
    "Meatloaf again!?"
  end
end

module Helpable
  def help_student
    "Let's get your school work done!"
  end

  def watch_at_recess
    "Stop hitting Sarah, Johnny!"
  end
end

module Supervisable
  def supervise
    "I'm supervising this class right now. Feels good."
  end
end

class Human
  include Eatable
end

class Teacher < Human
  include Helpable
  include Supervisable

  def teach
    "I'm teaching right now!"
  end
end

class Assistant < Human
  include Helpable

  def bathroom_emergency
    "Hold it in, kid!"
  end
end

class Principal < Human
  include Supervisable

  def expel
    "You're outta here!"
  end
end

class Janitor < Human
  def clean
    "These dern kids, always makin' messes..."
  end
end

class CafeteriaWorker < Human
  def serve_food
    "Get ya meatloaf! Meatloaf here!"
  end

  def eat
    "It's not bad, okay?"
  end
end

class Kid < Human
  def play
    "This is so fun!"
  end

  def learn
    "I want to go back outside!"
  end
end

teach = Teacher.new
caf = CafeteriaWorker.new
assistant = Assistant.new
kid = Kid.new
princ = Principal.new
jan = Janitor.new

p teach.teach
p princ.expel
p kid.play
p kid.learn
p assistant.bathroom_emergency
p caf.serve_food
p teach.help_student
p assistant.help_student
p princ.supervise
p teach.supervise
p jan.clean
p assistant.watch_at_recess

[assistant, kid, princ, jan, teach, caf].each do |people|
  p people.eat
end
