# frozen_string_literal: true
require 'date'

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'Что надо сделать?'

    @text = $stdin.gets.chomp

    puts 'К какому часлу надо сделать? дату в формате дд. мм. гггг.'

    input = $stdin.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r \n\r"
    deadline = "Крайний срок: #{@due_date}"
    [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge(
      {
        'text' => @text,
        'due_date' => @due_date.to_s
      }
    )
  end

  def load_date(data_hash)
    super(data_hash)
    @due_date = Date.parse(data_hash['due_date'])
  end
end
