class Turn
  attr_reader :guess,
              :secret_code

  def initialize(guess, secret_code)
    @guess = guess
    @secret_code = #how to call on instance variable initialized in game?
    @evaluator = Evaluator.new
  end
end
