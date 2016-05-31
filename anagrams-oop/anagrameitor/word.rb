require_relative 'anagram_util'

module Anagrameitor
  class Word
    include Comparable

    def initialize literal
      @literal = literal
    end

    def anagram? other
      AnagramUtil.anagrams? other.literal, @literal
    end

    def <=> other
      @literal <=> other.literal
    end

    def to_s
      @literal.dup
    end

    protected

    def literal
      @literal
    end
  end
end
