module Anagrameitor
  class Word
    def initialize literal
      @literal = literal
    end

    def anagram? other
      (other.literal != @literal) && (other.literal.size == @literal.size)
    end

    def == other
      @literal == other.literal
    end
    alias_method :eql?, :==

    def hash
      @literal.hash
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