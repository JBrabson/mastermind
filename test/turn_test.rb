require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
require './lib/evaluator'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new(@evaluator)
    @evaluator = Evaluator.new(@secret_code, @guess)
    @secret_code = ["r", "g", "b", "y"]
    @guess = ["r", "y", "g", "b"]
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Turn, @turn
    assert_equal ["r", "g", "b", "y"], @turn.evaluator.secret_code
    assert_equal ["r", "y", "g", "b"], @turn.evaluator.guess
  end

    #should new turns have both guesses or evaluator only?
  #   @new = Turn.new(["r", "g", "b", "y"],
  #                   ["r", "y", "g", "b"],
  #                    @evaluator)
  #   @evaluator = Evaluator.new
  # end
  #
  # def test_it_exists_and_has_attributes
  #   assert_instance_of Turn, @new
  #   assert_equal ["r", "g", "b", "y"], @new.guess
  #   assert_equal ["r", "y", "g", "b"], @new.secret_code
  # end
  #
  # def test_it_can_have_evaluated_matches
  #   assert_equal 2, @new.red_peg_exact_match
  #
  #
  # end
  #
  # # def count
end
