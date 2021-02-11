class Game
  attr_reader :codebreaker,
              :codemaker,
              :code

  def initialize(secret_code)
    @secret_code = secret_code
    @codemaker_guess = ""
    @guess_count
    @red_peg = 0 #correct color && correct location
    @white_peg = 0 #correct color && incorrect location
    @timer = "0min 0sec"
  end


  def codebreaker_guess
    user_input.split("") ## to transform data so we can compare to secret code
  end
end
