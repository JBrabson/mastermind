class CodeMaker

  attr_reader :colors,
              :number_of_positions

  def initialize(color)
    @colors = ["r", "y", "g", "b"]
    @number_of_positions = 4
  end

  def create_code_list(number_of_positions)
    @colors.repeated_permutation(number_of_positions).to_a
  end

  def secret_code
    create_code_list(number_of_positions).sample
  end

end
