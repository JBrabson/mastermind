require './lib/code_maker'
require './lib/messages'
require './lib/turn'
require 'time'

class Game
  attr_reader :secret_code,
              :guess,
              :guess_count,
              :message
              # :start_time

  def initialize
    @message = Messages.new
    @secret_code = CodeMaker.new.secret_code
    @guess_count = 0

    # @start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
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
          @start_time
          @message.play
          play
        elsif answer == ["q"]
          @message.quit
        else
          @message.input_invalid
        end
    elsif user_input == ["p"]
      @start_time
      @message.play
      play
    else user_input == ["q"]
      @message.quit
    end
  end

  def play
    guess = get_user_input
    @turn = Turn.new(guess, @secret_code, @guess_count)
    if @turn.valid?
      @guess_count +=1
      @turn.result
      p @secret_code.join
      puts "You've taken #{@guess_count} guesses\nWhat's your next guess?\nFeel like cheating? Press C for the hidden code so you can win (like a cheater)...\nor press Q at any time to quit."
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
    play
  end

  def cheat_or_quit
    input = gets.chomp.downcase
      if input == "q"
        @message.quit
        exit
      else input == "c"
        puts "Well, the secret code is '#{@secret_code.join}'. Not very secret anymore. 'GOOD LUCK' guessing the winning code.\nWhat's your next 'guess'?"
      end
  end

  def get_user_input
    gets.chomp.downcase.delete(" ").split("")
  end
end
