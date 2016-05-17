require 'minitest/test'
require 'minitest/autorun'

class TestAnagrams < Minitest::Test

  def test_dummy
    result = anagrams(['a', 'a'])

    assert_equal([['a', 'a']], result)
  end

  def test_one_anagram
    result = anagrams(['a', 'a', 'b'])

    assert_equal([['a', 'a']], result)
  end

  def test_no_anagrams
    result = anagrams(['a', 'b'])

    assert_equal([], result)
  end

  def test_occurences
    result = occurrences(['an', 'na'])

    assert_equal({an: ['an', 'na']}, result)
  end

  def test_several_occurences
    result = occurrences(['an', 'na', 'bo', 'ob'])

    assert_equal({an: ['an', 'na'], bo: ['bo', 'ob']}, result)
  end

  ##########################################################################

  def anagrams(input_list)
    occ = occurrences(input_list)
    anagrams = select_anagrams(occ)

    present(anagrams)
  end

  def select_anagrams(occurrences)
    occurrences.select{ |k, v| v.size > 1 }
  end

  def present(anagrams)
    anagrams.map{ |k, v| v }
  end

  def occurrences(input_list)
    input_list.each_with_object(Hash.new) do |word, acc|
      key = cannonical(word).to_sym
      acc[key] ||= []
      acc[key] << word
    end
  end

  def cannonical(word)
    word.chars.sort.join
  end

end
