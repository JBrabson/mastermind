require './lib/code_maker'
require './lib/messages'
require './lib/turn'

class Game
  attr_reader :secret_code,
              :guess,
              :guess_count,
              :message,
              :elapsed_time,
              :plural_or_single

  def initialize
    @message = Messages.new
    @secret_code = CodeMaker.new.secret_code
    @guess_count = 0
    @start_time = Time.now
    @end_time = Time.now
  end

  def start
    @message.start_message
    user_input = get_user_input
    until user_input == ["i"] || user_input == ["p"] || user_input == ["q"]
      @message.input_invalid
      user_input = get_user_input
    end
    if user_input == ["i"]
      instructions_path
    elsif user_input == ["p"]
      @start_time
      @message.play
      play
    else user_input == ["q"]
      @message.quit
    end
  end

  def instructions_path
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
  end

  def play
    guess = get_user_input
    elapsed_time = (@end_time - @start_time).round(0).divmod 60
    @turn = Turn.new(guess, @secret_code, @guess_count, elapsed_time)
    if @turn.valid?
      valid_path
    elsif
      guess == ["c"] || guess == ["q"]
      cheat_or_quit?(guess)
    else
      invalid_input_instruction
    end
    play
  end

  def valid_path
    @guess_count +=1
    p @secret_code.join
    @turn.result
    @end_time = Time.now
    puts "You've taken #{@guess_count} #{plural_or_single}.\nWhat's your next guess?" "(Or if you feel like cheating, you can press C for the hidden code... and win (like a cheater)...\n(You can also press Q at any time to quit.)"
  end

  def invalid_input_instruction
    if @turn.too_short? == true && @turn.characters_valid? == false
      @message.too_short_invalid_character
    elsif @turn.too_long? == true && @turn.characters_valid? == false
      @message.too_long_invalid_character
    elsif @turn.characters_valid? == false
      @message.invalid_characters
    elsif @turn.too_short? == true
      @message.too_short
    elsif @turn.too_long? == true
      @message.too_long
    end
  end

  def cheat_or_quit?(guess)
    if guess == ["q"]
      @message.quit
      exit
    elsif guess == ["c"]
      puts "Well, the secret code is '#{@secret_code.join}'. Not very secret anymore. 'GOOD LUCK' guessing the winning code.\nWhat's your next 'guess'?"
    else
      play
    end
  end

  def get_user_input
    gets.chomp.downcase.delete(" ").split("")
  end

  def plural_or_single
    if @guess_count == 1
      "guess"
    else
      "guesses"
    end
  end
end
