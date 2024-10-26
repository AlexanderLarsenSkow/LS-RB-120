class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    tasks = @tasks.select do |task|
      task.priority == :high
    end

    display(tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)
valentinas_tasks.display_all_tasks

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks #
valentinas_tasks.display_high_priority_tasks

# We are getting a `nil` value when we call `TaskManager#display_high_priority_tasks` on the `valentinas_tasks` object.
# The reason is becauase in the method definition from lines 34 to 37, a new local variable `tasks` is assigned to 
# reference the new array after `select` is called on the array referenced by the `@tasks` instance variable.
# However, when `tasks` is assigned, when `tasks` is called in the code afterward, Ruby thinks that it is the same local variable
# that was just initialized, which is still referencing `nil`.
# The fix for this is to use `self.tasks` or `@tasks` or to rename the `tasks` local variable to something like `h_p_tasks`.
# Then the issue between the local varaible and the instance variable names is resolved.





