class Turn
  attr_reader :guess,
              :secret_code

  def initialize(guess, secret_code)
    @guess = guess
    @secret_code = secret_code
  end
end
