require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
require './lib/evaluator'
require './lib/turn'

  class TurnTest < Minitest::Test

    def test_it_exists_and_has_attributes
    new = Turn.new(["r", "g", "b", "y"], ["r", "y", "g", "b"])
    assert_instance_of Turn, new
    assert_equal ["r", "g", "b", "y"], new.turn_guess
    assert_equal ["r", "y", "g", "b"], new.game_hidden_code
    end
end
