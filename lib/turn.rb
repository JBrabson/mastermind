class Turn
  attr_reader :turn_guess,
              :game_hidden_code

  def initialize(turn_guess, game_hidden_code)
    @turn_guess = turn_guess
    @game_hidden_code = game_hidden_code
  end
end
