class Todo

  def initialize(description)
    @description = description
    @done = false
  end

  def description
    @description
  end

  def done?
    @done
  end

  def done!
    @done = true
  end

  def printable_line
    if done?
      "[X] #{description}"
    else
      "[ ] #{description}"
    end
  end

end

class TodoList

  def initialize
    @todos = []
  end

  def todos
    @todos
  end

  def print_todos
    todos.each_with_index do |todo, index|
      puts "(#{index}) #{todo.printable_line}"
    end
  end

  def add_todo(description)
    @todos << Todo.new(description)
  end

  def delete_todo_number(index)
    @todos.delete_at(index)
  end

  def check_todo_number(index)
    @todos[index].done!
    @todos[index]
  end

  def size
    @todos.size
  end

end

puts "Welcome to the Todo Script"

todo_list = TodoList.new

loop do
  print "> "
  line = gets.chomp
  if line == "quit"
    puts "Goodbye"
    break
  elsif line == "list"
    todo_list.print_todos
  elsif line == "add"
    print "Add todo: "
    todo = gets.chomp
    todo_list.add_todo(todo)
    puts "Your todo has been added. It now has #{todo_list.size} items."
  elsif line == "done"
    puts "Which one is done (enter the number)?"
    todo_list.print_todos
    todo_number = gets.chomp.to_i
    checked_todo = todo_list.check_todo_number(todo_number)
    puts "You're done with: #{checked_todo.description}"
  elsif line == "remove"
    puts "Which one should be removed (enter the number)?"
    todo_list.print_todos
    todo_number = gets.chomp.to_i
    removed_todo = todo_list.delete_todo_number(todo_number)
    puts "You've removed: #{removed_todo.description}"
  end
end

