require './lib/messages'

class Game

  def initialize
    @message = Messages.new
    @turn = Turn.new
  end

  def start
    @message.start_message
    user_input = gets.chomp.downcase
    valid = "i" || "p" || "q"

    while user_input != valid
      @message.input_invalid
      user_input = gets.chomp.downcase
    end

    if user_input == valid
      if user_input == "i"
      @message.instructions
      elsif user_input == "p"
      @message.play
      #gets chomp? to turn eval?
      else user_input == "q"
      @message.quit
      end
    end
  end

end
