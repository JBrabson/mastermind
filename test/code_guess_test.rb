require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_guess'

class CodeGuessTest < Minitest::Test
  def test_it_exists_and_has_attributes
    code_guess = CodeGuess.new(["r", "g", "b", "y"])
    assert_instance_of CodeGuess, code_guess
    assert_equal ["r", "g", "b", "y"], code_guess.combo
  end

  def test_only_contains_allowed_characters
    code_guess1 = CodeGuess.new(["r", "g", "b", "y"])
    code_guess2 = CodeGuess.new(["c", "d", "e", "f"])
    code_guess3 = CodeGuess.new(["1", "d", "3", "d"])
    assert_equal true, code_guess1.characters_valid?
    assert_equal false, code_guess2.characters_valid?
    assert_equal false, code_guess3.characters_valid?
  end

  def test_is_correct_length
    code_guess1 = CodeGuess.new(["r", "g", "b", "y"])
    code_guess2 = CodeGuess.new(["r", "g", "b"])
    code_guess3 = CodeGuess.new(["r", "g", "b", "y", "r", "g", "b", "y"])
    assert_equal 4, code_guess1.combo.length
    assert_equal true, code_guess1.length_valid?
    assert_equal false, code_guess2.length_valid?
    assert_equal false, code_guess3.length_valid?
  end

  def test_guess_is_valid
    code_guess1 = CodeGuess.new(["r", "g", "b", "y"])
    code_guess2 = CodeGuess.new(["r", "g", "b"])
    code_guess3 = CodeGuess.new(["r", "g", "b", "y", "r", "g", "b", "y"])
    assert_equal true, code_guess1.input_valid?
    assert_equal false, code_guess2.input_valid?
    assert_equal false, code_guess3.input_valid?
  end

  # def test_it_can_randomize
  #
  # end
end
