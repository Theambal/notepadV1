class Memo < Post

  def read_from_console
    puts "Новая заметка (всё, что пишите до строчки \"end\")"
    line = nil
    @text = []
    while line != "end" do
      line = STDIN.gets.encoding('UTF-8').chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"
    return @text.unshift(time_string)
  end
  
end