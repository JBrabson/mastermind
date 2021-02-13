class Evaluator
  attr_reader :red_peg_exact_match,
              :white_peg_partial_match,
              :guess_count,
              :color_match

  def initialize(secret_code, guess)
    @guess = [] # add guess from game
    @secret_code = [] # add code from code maker
    @red_peg_exact_match = 0 #correct color && correct location
    @white_peg_partial_match = 0 #correct color && incorrect location
    @guess_count = 0 #of "turns"
    @color_match = 0
  end

  def correct_color_correct_location_count(secret_code, guess)
    secret_code.each_with_index do |color, index|
      if color == guess[index]
        @red_peg_exact_match += 1
      end
    end
  return @red_peg_exact_match
end

  def correct_color_count(secret_code, guess)
    secret_code.uniq.each do |color|
      if guess.uniq.include?(color)
      @color_match += 1
    end
  end
  return @color_match #remeber not to put return in the loop!!!
end

  def partial_match_count
    @color_match - @red_peg_exact_match
  end
end
