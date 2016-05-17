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
    occurrences = Hash.new(0)

    input_list.each do |e|
      occurrences[e] = occurrences[e] + 1
    end

    selected = occurrences.select{ |k, v| v > 1 }

    result = selected.map{ |k, v| [k]*v }

    result.flatten
  end

end
