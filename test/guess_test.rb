require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_exists_and_has_attributes
    guess = Guess.new(["r", "g", "b", "y"])
    assert_instance_of Guess, guess
    assert_equal ["r", "g", "b", "y"], guess.guess_array
  end

  def test_only_contains_allowed_characters
    guess1 = Guess.new(["r", "g", "b", "y"])
    guess2 = Guess.new(["c", "d", "e", "f"])
    guess3 = Guess.new(["1", "d", "3", "d"])
    assert_equal true, guess1.characters_valid?
    assert_equal false, guess2.characters_valid?
    assert_equal false, guess3.characters_valid?
  end

  def test_is_correct_length
    #add messages
    guess1 = Guess.new(["r", "g", "b", "y"])
    guess2 = Guess.new(["r", "g", "b"])
    guess3 = Guess.new(["r", "g", "b", "y", "r", "g", "b", "y"])
    assert_equal 4, guess1.guess_array.length
    assert_equal true, guess1.length_valid?
    assert_equal false, guess2.length_valid?
    assert_equal false, guess3.length_valid?
  end

  def test_guess_is_valid
    guess1 = Guess.new(["r", "g", "b", "y"])
    guess2 = Guess.new(["r", "g", "b"])
    guess3 = Guess.new(["r", "g", "b", "y", "r", "g", "b", "y"])
    assert_equal true, guess1.valid?
    assert_equal false, guess2.valid?
    assert_equal false, guess3.valid?
  end
end
