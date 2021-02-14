class CodeMaker

  attr_reader :secret_code

  def initialize
    @colors = ["r", "y", "g", "b"]
    @number_of_positions = 4
    @secret_code = []
  end

  def create_code_list
    @colors.repeated_permutation(@number_of_positions).to_a
  end

  def secret_code
    @secret_code = create_code_list.sample
  end

end
