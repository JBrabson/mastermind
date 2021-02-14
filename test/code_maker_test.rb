require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'

class CodeMakerTest < Minitest::Test

  def test_it_exists
    code = CodeMaker.new
    assert_instance_of CodeMaker, code
  end

  def test_it_creates_code_list
    code = CodeMaker.new
    assert_equal 256, code.create_code_list.length
  end

  def test_it_can_change_secret_code
    code = CodeMaker.new
    code.create_code_list
    secret_code1 = code.secret_code
    secret_code2 = code.secret_code

    assert_equal 4, code.secret_code.length
    assert_equal false, secret_code1 == secret_code2
  end

end
