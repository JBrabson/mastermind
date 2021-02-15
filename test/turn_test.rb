require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new(["g", "r", "r", "b"], ["r", "r", "g", "b"])
    assert_instance_of Turn, turn
  end

  def test_only_contains_allowed_characters
    turn1 = Turn.new(["r", "g", "b", "y"], ["r", "r", "g", "b"])
    turn2 = Turn.new(["c", "d", "e", "f"], ["r", "r", "g", "b"])
    turn3 = Turn.new(["1", "d", "3", "d"], ["r", "r", "g", "b"])
    assert_equal true, turn1.characters_valid?
    assert_equal false, turn2.characters_valid?
    assert_equal false, turn3.characters_valid?
  end

  def test_is_correct_length
    #add messages
    turn1 = Turn.new(["r", "g", "b", "y"], ["r", "r", "g", "b"])
    turn2 = Turn.new(["r", "g", "b"], ["r", "r", "g", "b"])
    turn3 = Turn.new(["r", "g", "b", "y"], ["r", "g", "b", "y"])
    assert_equal 4, turn1.guess.length
    assert_equal true, turn1.length_valid?
    assert_equal false, turn2.length_valid?
    assert_equal false, turn3.length_valid?
  end

  def test_turn_is_valid
    turn1 = Turn.new(["r", "g", "b", "y"], ["r", "r", "g", "b"])
    turn2 = Turn.new(["r", "g", "b"], ["r", "r", "g", "b"])
    turn3 = Turn.new(["r", "g", "b", "y"], ["r", "g", "b", "y"])
    assert_equal true, turn1.valid?
    assert_equal false, turn2.valid?
    assert_equal false, turn3.valid?
  end

  def test_it_can_evaluate_right_color_right_place_exact_match
  # skip
  turn = Turn.new(["g", "r", "r", "b"], ["r", "r", "g", "b"])
  secret_code = ["g", "r", "r", "b"]
  guess =       ["r", "r", "g", "b"]

  assert_equal 2, turn.correct_color_correct_location_count(secret_code, guess)
  end

  def test_it_can_evaluate_right_color_wrong_place_partial_match
  # skip
  turn = Turn.new(["g", "r", "r", "b"], ["r", "r", "g", "b"])
  secret_code = ["g", "r", "r", "b"]
  guess =       ["r", "r", "g", "b"]
  assert_equal 3, turn.correct_color_count(secret_code, guess)
  end
end
