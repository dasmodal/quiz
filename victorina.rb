require 'timeout'
require_relative 'lib/game'
require_relative 'lib/question'
require_relative 'lib/questions_reader'

file_name = File.join(__dir__, 'data', 'questions.xml')

questions = QuestionsReader.from_xml(file_name)
game = Game.new(questions)

until game.finished?
  puts game.next_question

  question = game.current_question

  begin
    guessed_index = Timeout.timeout(question.time) { $stdin.gets.to_i }
  rescue Timeout::Error
    puts game.time_out
    exit
  end

  if question.correctly_answered?(guessed_index)
    puts 'Верный ответ!'

    game.score_up!
  else
    puts "Неправильно. Правильный ответ: #{question.right_answer}"
  end
end

puts
puts game.show_result
