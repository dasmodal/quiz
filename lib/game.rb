class Game
  QUESTION_COUNT = 5

  attr_accessor :current_question

  def initialize(questions)
    @current_index = 0
    @current_question = nil
    @right_answers = 0
    @score = 0
    @questions = questions.sample(QUESTION_COUNT)
  end

  def finished?
    @current_index >= @questions.size
  end

  def next_question
    @current_question = @questions[@current_index]
    @current_index += 1
    @current_question
  end

  def score_up!
    @right_answers += 1
    @score += @current_question.points
  end

  def show_result
    <<~RESULT
      Правильных ответов: #{@right_answers} из #{@questions.size}
      Количество набранных баллов: #{@score}
    RESULT
  end

  def time_out
    <<~TIME_OUT
      Слишком долго. Время вышло!
      #{show_result}
    TIME_OUT
  end
end
