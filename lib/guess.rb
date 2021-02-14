class Guess
  attr_reader :guess_array

  def initialize(guess_array)
    @guess_array = guess_array
  end

  def valid?
    characters_valid? && length_valid?
  end

  def characters_valid?
    @guess_array.all? do |letter|
      letter == "r" || letter == "g" || letter == "b" || letter == "y"
    end
  end

  def length_valid?
    @guess_array.length == 4
  end
end
