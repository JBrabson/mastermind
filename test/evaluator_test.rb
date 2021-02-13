require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
require './lib/evaluator'

class EvaluatorTest < Minitest::Test

  def test_it_exists
    evaluator = Evaluator.new(["y", "b", "r", "b"], ["y", "y", "b", "g"])
    assert_instance_of Evaluator, evaluator
  end

  def test_it_can_evaluate_right_color_right_place
  # skip
  evaluator = Evaluator.new(["y", "b", "r", "b"], ["y", "y", "b", "g"])
  secret_code = ["y", "b", "r", "b"]
  guess =       ["y", "y", "b", "g"]

  assert_equal 1, evaluator.correct_color_correct_location_count(secret_code, guess)
  end

  def test_it_can_evaluate_right_color_wrong_place
  # skip
  evaluator = Evaluator.new(["y", "b", "r", "b"], ["y", "y", "b", "g"])
  secret_code = ["y", "b", "r", "b"]
  guess =       ["y", "y", "b", "g"]
  assert_equal 2, evaluator.correct_color_count(secret_code, guess)
  end

  def test_it_can_calculate_partial_match
  evaluator = Evaluator.new(["y", "b", "r", "b"], ["y", "y", "b", "g"])
  secret_code = ["y", "b", "r", "b"]
  guess =       ["y", "y", "b", "g"]
  evaluator.correct_color_correct_location_count(secret_code, guess)
  evaluator.correct_color_count(secret_code, guess)
  assert_equal 1, evaluator.partial_match_count
  end
end
