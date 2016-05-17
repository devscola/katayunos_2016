require 'minitest/test'
require 'minitest/autorun'

class TestAnagrams < Minitest::Test

  def test_dummy
    result = anagrams(['a', 'a'])

    assert_equal(['a', 'a'], result)
  end

  def test_one_anagram
    result = anagrams(['a', 'a', 'b'])

    assert_equal(['a', 'a'], result)
  end


  def anagrams(input_list)
    occ = occurrences(input_list)
    selected = occ.select{ |k, v| v > 1 }
    result = selected.map{ |k, v| [k]*v }
    result.flatten
  end

  def occurrences(input_list)
    input_list.each_with_object(Hash.new(0)) do |e, acc|
      acc[e] = acc[e] + 1
    end
  end

end
