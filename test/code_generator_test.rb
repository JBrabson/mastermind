require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'
require './lib/code_generator'

class CodeGeneratorTest < Minitest::Test

  def test_it_exists
    code = Code.new("r", "y", "g", "b")
    assert_instance_of Code, code
  end
end
  # def test_it_creates_code_list
  #   code = Code.new(["r", "y", "g", "b"])
  #
  #   assert_equal 214, code.create_code_list
  # end
