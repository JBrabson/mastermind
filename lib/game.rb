require './lib/code_maker'
require './lib/messages'
require './lib/turn'

class Game
  attr_reader :secret_code,
              :guess,
              :guess_count

  def initialize
    @message = Messages.new
    @secret_code = CodeMaker.new.secret_code
    @guess_count = 0
    @start_time = Time.now
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
    @guess_count +=1
    @turn = Turn.new(guess, @secret_code)

    if @turn.valid?
      @turn.result
      puts "You've taken #{@guess_count} guesses"

    elsif
        @turn.characters_valid? == false
        @message.invalid_characters
      elsif
        @turn.too_short? == true
        @message.too_short
      else
        @turn.too_long? == true
        @message.too_long
      end
    end

  def get_user_input
    gets.chomp.downcase.delete(" ").split("")
  end
end
