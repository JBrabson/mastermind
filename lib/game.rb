require './lib/messages'

class Game

  def initialize
    @message = Messages.new
    # @turn = Turn.new
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
          answer = gets.chomp.downcase
            # if answer is valid, etc.
        elsif answer == "q"
          @message.quit
        else
          @message.input_invalid
        end
    elsif user_input == "p"
      @message.play
      # turn
    else user_input == "q"
      @message.quit
    end
  end
end
