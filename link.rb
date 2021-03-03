# frozen_string_literal: true

class Link < Post
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts 'Адрес ссылки:  '
    @url = $stdin.gets.chomp
    puts 'Что за ссылка?'
    @text = $stdin.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r \n\r"
    [@url, @text, time_string]
  end

  def to_db_hash
    super.merge(
      {
        'text' => @text,
        'url' => @url
      }
    )
  end

  def load_date(data_hash)
    super(data_hash)
    @url = data_hash['url']
  end
end
