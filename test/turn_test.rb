require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
require './lib/turn'
require './lib/messages'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new(["g", "r", "r", "b"], ["r", "r", "g", "b"], 0, Time.now)
    assert_instance_of Turn, turn
  end

  def test_only_contains_allowed_characters
    turn1 = Turn.new(["r", "g", "b", "y"], ["r", "r", "g", "b"], 0, Time.now)
    turn2 = Turn.new(["c", "d", "e", "f"], ["r", "r", "g", "b"], 0, Time.now)
    turn3 = Turn.new(["1", "d", "3", "d"], ["r", "r", "g", "b"], 0, Time.now)
    assert_equal true, turn1.characters_valid?
    assert_equal false, turn2.characters_valid?
    assert_equal false, turn3.characters_valid?
  end

  def test_is_correct_length
    # skip
    turn1 = Turn.new(["r", "g", "b", "y"], ["r", "r", "g", "b"], 0, Time.now)
    turn2 = Turn.new(["r", "g", "b"], ["r", "r", "g", "b"], 0, Time.now)
    turn3 = Turn.new(["r", "g", "b", "y", "y"], ["r", "g", "b", "y"], 0, Time.now)
    assert_equal 4, turn1.guess.length
    assert_equal false, turn1.too_long?
    assert_equal false, turn1.too_short?
    assert_equal true, turn2.too_short?
    assert_equal true, turn3.too_long?
  end

  def test_turn_is_valid
    # skip
    turn1 = Turn.new(["r", "g", "x", "y"], ["r", "r", "g", "b"], 0, Time.now)
    turn2 = Turn.new(["r", "g", "b"], ["r", "r", "g", "b"], 0, Time.now)
    turn3 = Turn.new(["r", "g", "b", "y", "y"], ["r", "g", "b", "y"], 0, Time.now)
    assert_equal false, turn1.valid?
    assert_equal false, turn2.valid?
    assert_equal false, turn3.valid?
  end

  # def test_it_announces_win
  #   turn1 = Turn.new(["r", "g", "b", "y"], ["r", "r", "g", "b"], 1, Time.now)
  #   turn2 = Turn.new(["r", "b", "b", "b"], ["r", "r", "g", "b"], 2, Time.now)
  #   assert_equal
  # end

  def test_it_can_evaluate_right_color_right_place_exact_match
  # skip
  turn = Turn.new(["g", "r", "r", "b"], ["r", "r", "g", "b"], 0, Time.now)
  secret_code = ["g", "r", "r", "b"]
  guess =       ["r", "r", "g", "b"]
  assert_equal 2, turn.correct_color_correct_location_count(secret_code, guess)
  end

  def test_it_can_evaluate_right_color_wrong_place_partial_match
  # skip
  turn = Turn.new(["g", "r", "r", "b"], ["r", "r", "g", "b"], 0, Time.now)
  secret_code = ["g", "r", "r", "b"]
  guess =       ["r", "r", "g", "b"]
  assert_equal 3, turn.correct_color_count(secret_code, guess)
  end
end
