class Turn
  attr_reader :guess,
              :secret_code

#how to interpolate from gets to below?
  def initialize(guess, secret_code)
    @guess = guess
    @secret_code = secret_code
  end

  def evaluate
  end
end
