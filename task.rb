# encoding: utf-8
require "date"

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "Что надо сделать?"

    @text = STDIN.gets.chomp

    puts "К какому часлу надо сделать? дату в формате дд. мм. гггг."

    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r \n\r"
    deadline = "Крайний срок: #{@due_date}"
    return [deadline, @time, time_string]
  end


end