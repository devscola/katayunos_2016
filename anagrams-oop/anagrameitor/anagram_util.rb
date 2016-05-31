module Anagrameitor
  module AnagramUtil
    def self.anagrams? a_word, another_word
      (a_word != another_word) && (another_word.chars.sort == a_word.chars.sort)
    end
  end
end
