module Anagrameitor
  module AnagramUtil
    def self.anagram? a_word_literal, another_word_literal
      (a_word_literal != another_word_literal) && (another_word_literal.chars.sort == a_word_literal.chars.sort)
    end
  end
end
