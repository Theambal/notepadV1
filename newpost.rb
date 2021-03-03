# frozen_string_literal: true

require 'date'
require_relative 'post'
require_relative 'memo'
require_relative 'task'
require_relative 'link'

puts 'Привет я твой блокнот!'
puts 'Что хотите записать в блокнот?'

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index} #{type}"
  end

  choice = $stdin.gets.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console

id = entry.save_to_db

puts "Ура запись сохранена!  id = #{id}"
