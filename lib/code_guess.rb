class CodeGuess
  attr_reader :combo

  def initialize(combo)
    @combo = combo


  end

  def characters_valid?
    @combo.all? do |letter|
      letter == "r" || letter == "g" || letter == "b" || letter == "y"
    end
  end

  def length_valid?
    @combo.length == 4
  end

  def input_valid?
    characters_valid? && length_valid?
  end

end
