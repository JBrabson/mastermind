require './lib/code_maker'
# require './lib/codebreaker'
require './lib/evaluator'
require './lib/guess'
require './lib/messages'
require './lib/turn'

class Game
  attr_accessor :secret_code
  attr_reader :colors,
              :number_of_positions

  def initialize
    @message = Messages.new
    @secret = CodeMaker.new(colors, number_of_positions).secret_code
  end

  def start
    @message.start_message
    user_input = gets.chomp.downcase

    until user_input == "i" || user_input == "p" || user_input == "q"
      @message.input_invalid
      user_input = gets.chomp.downcase
    end

    if user_input == "i"
      @message.instructions
      answer = gets.chomp.downcase
        if answer == "p"
          @message.play
          # turn = Turn.new(answer, @secret)
          turn = Turn.new(@evaluator)
          evaluator = Evaluator.new(answer, @secret)
          # @guess_array = gets.chomp.downcase
          #   #if answer then evaluate else quit
        elsif answer == "q"
          @message.quit
        else
          @message.input_invalid
        end
    elsif user_input == "p"
      @message.play
      # turn = Turn.new(answer, @secret)
      turn = Turn.new(evaluator)
      evaluator = Evaluator.new(answer, @secret)
    else user_input == "q"
      @message.quit
    end
  end
end
