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

  def test_no_anagrams
    result = anagrams(['a', 'b'])

    assert_equal([], result)
  end

  def test_occurences
    result = occurrences(['an', 'na'])

    assert_equal({an: ['an', 'na']}, result)
  end

  def anagrams(input_list)
    occ = occurrences(input_list)
    anagrams = select_anagrams(occ)

    present(anagrams)
  end

  def select_anagrams(occurrences)
    occurrences.select{ |k, v| v > 1 }
  end

  def present(anagrams)
    anagrams.map{ |k, v| [k]*v }.flatten
  end

  def occurrences(input_list)
    input_list.each_with_object(Hash.new) do |word, acc|
      cannonical = word.chars.sort.join
      acc[cannonical.to_sym] ||= []
      acc[cannonical.to_sym] << word
    end
  end

end
