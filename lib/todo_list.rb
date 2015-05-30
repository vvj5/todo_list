require_relative "todo"
require_relative "../db/setup.rb"

class TodoList
  def initialize
    @todos = Todo.all
  end

  def start
    loop do
      system('clear')

      puts "---- TODO LIST ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = gets.chomp.to_i
      case action
      when 1 then exit
      when 2 then add_todo
      when 3 then mark_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def add_todo
    puts "Add your todo item"
    Todo.create(entry: get_input)
  end

  def view_todos
    @todos.each do |item|
      puts item.entry
    end
  end

  def mark_todo
    puts "Which item have you completed?"
  end


  private
  def get_input
    gets.chomp
  end
end
