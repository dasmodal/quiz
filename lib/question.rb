class Question
  attr_reader :points, :time, :right_answer

  def initialize(params)
    @time = params[:time].to_i
    @text = params[:text]
    @right_answer = params[:right_answer]
    @variants = params[:variants].shuffle
    @points = params[:points].to_i
  end

  def correctly_answered?(user_index)
    return false if @variants[user_index - 1].nil? || user_index.zero?

    @right_answer.downcase == @variants[user_index - 1].downcase
  end

  def to_s
    <<~QUESTION

      #{@text} (баллов: #{@points}). Время на ответ: #{@time} сек.

      #{@variants.map.with_index(1) { |variant, index| "#{index}. #{variant}" }.join("\n")}

    QUESTION
  end
end
