class Turn
  attr_reader :evaluator

  def initialize(evaluator)
    # @guess = guess
    # @secret_code = secret_code
    @evaluator = Evaluator.new(@guess, @secret_code)
  end
end
