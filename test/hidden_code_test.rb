require 'minitest/autorun'
require 'minitest/pride'
require './lib/hidden_code'

class HiddenCodeTest < Minitest::Test
  def test_it_exists_and_has_attributes
    hidden_code = HiddenCode.new(["r", "g", "b", "y"])
    assert_instance_of HiddenCode, hidden_code
    assert_equal ["r", "g", "b", "y"], hidden_code.combo
  end

  def test_only_contains_allowed_characters
    hidden_code_1 = HiddenCode.new(["r", "g", "b", "y"])
    hidden_code_2 = HiddenCode.new(["c", "d", "e", "f"])
    hidden_code_3 = HiddenCode.new(["1", "d", "3", "d"])
    assert_equal true, hidden_code_1.valid?
    assert_equal false, hidden_code_2.valid?
    assert_equal false, hidden_code_3.valid?
  end

  def test_is_correct_length
    hidden_code_1 = HiddenCode.new(["r", "g", "b", "y"])
    hidden_code_2 = HiddenCode.new(["r", "g", "b"])
    hidden_code_3 = HiddenCode.new(["r", "g", "b", "y", "r", "g", "b", "y"])
    assert_equal true, hidden_code_1.valid?
    assert_equal false, hidden_code_2.valid?
    assert_equal false, hidden_code_3.valid?
  end
end
