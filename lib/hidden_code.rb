class HiddenCode
  attr_reader :combo

  def initialize(combo)
    @combo = combo

  end

  def valid?
    @combo.all? do |letter|
      letter == "r" || letter == "g" || letter == "b" || letter == "y"
    end
  end
end
