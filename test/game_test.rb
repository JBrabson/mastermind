require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new(["r", "y", "g", "b"])
    assert_instance_of Game, game
  end

  def test_it_can_transform_user_input
    game = Game.new(["r", "y", "g", "b"])
    user_input = "rygb"
    assert_equal (["r", "y", "g", "b"]), game.user_input.codebreaker_guess
  end

end
