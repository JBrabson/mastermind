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
    @secret = CodeMaker.new.secret_code
  end

  def start
    @message.start_message
    user_input = get_user_input

    until user_input == ["i"] || user_input == ["p"] || user_input == ["q"]
      @message.input_invalid
      user_input = get_user_input
    end

    if user_input == ["i"]
      @message.instructions
      answer = get_user_input
        if answer == ["p"]
          play
        elsif answer == ["q"]
          @message.quit
        else
          @message.input_invalid
        end
    elsif user_input == ["p"]
      play
    else user_input == ["q"]
      @message.quit
    end
  end

  def play
    @message.play
    guess = get_user_input
    evalguess = Guess.new(guess)
    # require 'pry'; binding.pry
      if evalguess.valid?
        turn = Turn.new(guess, @secret)
      else
        if evalguess.characters_valid? == false
          @message.invalid_characters
        else evalguess.length_valid? == false
          if evalguess.guess_array.count < 4
            @message.too_short
          else evalguess.guess_array.count > 4
            @message.too_long
          end
        end
      end
  end

  def get_user_input
    gets.chomp.downcase.delete(" ").split("")
  end

end
