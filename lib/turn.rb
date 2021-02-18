class Turn
  attr_reader :guess,
              :secret_code,
              :winner,
              :quit,
              :red_peg_exact_match,
              :white_peg_partial_match,
              :color_match,
              :elapsed_time

  def initialize(guess, secret_code, guess_count, elapsed_time)
    @guess = guess
    @secret_code = secret_code
    @guess_count = (guess_count += 1)
    @red_peg_exact_match = 0
    @white_peg_partial_match = 0
    @color_match = 0
    @message = Messages.new
    @elapsed_time = elapsed_time
  end

  def valid?
    characters_valid? && too_long? == false && too_short? == false
  end

  def characters_valid?
    @guess.all? do |letter|
      letter == "r" || letter == "g" || letter == "b" || letter == "y"
    end
  end

  def too_long?
    @guess.length > 4
  end

  def too_short?
    @guess.length < 4
  end

  def winner
    puts "Congratulations! You guessed '#{@guess.join}'\nin #{@guess_count} guesses in #{@elapsed_time[0]} mins and #{@elapsed_time[1]} seconds.\nDo you want to play again or quit?"
    user_input = gets.chomp.downcase
    until user_input == "p" || user_input == "q" || user_input == "play" || user_input == "quit"
      @message.play_again_or_quit
      user_input = gets.chomp.downcase
    end
    if user_input == "p" || user_input == "play"
      replay
    else user_input == "q" || user_input == "quit"
      @message.quit
      exit
    end
  end

  def replay
    game = Game.new
    @start_time
    @message.play
    game.play
  end

  def result
    if @secret_code == @guess
      winner
    else
      correct_color_correct_location_count(secret_code, guess)
      correct_color_count(secret_code, guess)
      puts "#{@guess.join("").upcase} has #{@color_match} of the correct elements with #{@red_peg_exact_match} in the correct positions"
    end
  end

  def correct_color_correct_location_count(secret_code, guess)
    @secret_code.each_with_index do |color, index|
      if color == @guess[index]
        @red_peg_exact_match += 1
      end
    end
    @red_peg_exact_match
  end

  def correct_color_count(secret_code, guess)
    @secret_code.uniq.each do |color|
      if @guess.uniq.include?(color)
        @color_match += 1
      end
    end
    @color_match
  end
end
