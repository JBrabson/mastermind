require './lib/code_maker'
# require './lib/codebreaker'
require './lib/evaluator'
require './lib/guess'
require './lib/messages'
# require './lib/turn'

class Game
  attr_accessor :secret_code
  attr_reader :colors,
              :number_of_positions

  def initialize
    @message = Messages.new
    @secret = CodeMaker.new(colors, number_of_positions).secret_code    # @turn = Turn.new
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
          # @secret.secret_code
          # @message.play
          # @guess_array = gets.chomp.downcase
          #   #if answer then evaluate else quit
        elsif answer == "q"
          @message.quit
        else
          @message.input_invalid
        end
    elsif user_input == "p"
      @message.play
      secret = @secret.secret_code
      guess = gets.chomp.downcase
      # @turn = Turn.new(answer, secret)
    else user_input == "q"
      @message.quit
    end
  end
end
