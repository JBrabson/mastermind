require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
require './lib/evaluator'

class EvaluatorTest < Minitest::Test

  def test_it_exists
    evaluator = Evaluator.new(["g", "r", "r", "b"], ["r", "r", "g", "b"])
    assert_instance_of Evaluator, evaluator
  end

  def test_it_can_evaluate_right_color_right_place_exact_match
  # skip
  evaluator = Evaluator.new(["g", "r", "r", "b"], ["r", "r", "g", "b"])
  secret_code = ["g", "r", "r", "b"]
  guess =       ["r", "r", "g", "b"]

  assert_equal 2, evaluator.correct_color_correct_location_count(secret_code, guess)
  end

  def test_it_can_evaluate_right_color_wrong_place_partial_match
  # skip
  evaluator = Evaluator.new(["g", "r", "r", "b"], ["r", "r", "g", "b"])
  secret_code = ["g", "r", "r", "b"]
  guess =       ["r", "r", "g", "b"]
  assert_equal 3, evaluator.correct_color_count(secret_code, guess)
  end
end
