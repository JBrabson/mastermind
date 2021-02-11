require 'minitest/autorun'
require 'minitest/pride'
require './lib/hidden_code'
require './lib/codebreaker'

class CodeBreakerTest < Minitest::Test
  def test_it_exists
    player = CodeBreaker.new
    assert_instance_of CodeBreaker, player
  end

end
