require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'

class CodeTest < Minitest::Test

  def test_it_exists
    code = Code.new(["r", "y", "g", "b"])
    assert_instance_of Code, code
  end

  def test_it_creates_code_list
    code = Code.new(["r", "y", "g", "b"])
    assert_equal 256, code.create_code_list(4).length
  end

end
