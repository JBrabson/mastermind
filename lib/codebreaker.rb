class CodeBreaker

  def initialize(game.guess)
    @guess = []
  end

  def codebreaker_guess
    @game.guess.split("") ## to transform data so we can compare to secret code
  end
end
