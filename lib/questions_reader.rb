require 'rexml/document'

class QuestionsReader
  def self.from_xml(file_name)
    doc = REXML::Document.new(File.new(file_name))

    doc.get_elements('questions/question').map do |question|
      right_answer = []
      variants = []

      time = question.attributes['seconds'].to_i
      points = question.attributes['points']
      text = question.elements['text'].text
      question.elements.each('variants/variant') { |e| variants << e.text }

      question.elements['variants'].each_element_with_attribute('right', 'true') do |e|
        right_answer << e.text
      end

      Question.new(
        time: time,
        text: text,
        right_answer: right_answer.join,
        variants: variants,
        points: points
      )
    end
  end
end
