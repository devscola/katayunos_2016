module Anagrameitor
  class Words
    include Comparable

    def initialize words=[]
      @words = words
      @index = -1
    end

    def add word
      @words << word
    end

    def next?
      @index < @words.size - 1
    end

    def next
      @index += 1
      Word.new @words[@index]
    end

    def <=> other
      @words.sort <=> other.words.sort
    end

    def clone
      Words.new @words
    end

    def empty?
      @words.empty?
    end

    def to_a
      @words.map(&:to_s)
    end

    protected

    def words
      @words
    end
  end
end