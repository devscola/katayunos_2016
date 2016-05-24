require_relative 'anagrameitor/word'
require_relative 'anagrameitor/words'
require_relative 'anagrameitor/anagrams'

module Anagrameitor
  def self.anagrams_in word_list
    words = Words.new word_list

    result = Anagrams.new
    while words.next?
      candidate = words.next
      anagrams = detect_anagrams_for candidate, words
      result.include anagrams
    end

    result.to_a
  end

  def self.detect_anagrams_for candidate, words
    result = Words.new
    words = words.clone
    
    while words.next?
      the_word = words.next
      if the_word.anagram? candidate
        result.add candidate
        result.add the_word
      end
    end
    
    result
  end
end
