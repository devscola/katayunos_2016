require 'minitest/test'
require 'minitest/autorun'

class TestAnagrams < Minitest::Test

  def test_dummy
    result = anagrams(['a', 'a'])

    assert_equal(['a', 'a'], result)
  end


  def anagrams(input_list)
    input_list
  end

end
