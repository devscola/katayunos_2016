module Anagrameitor
  class Words
    def initialize words=[]
      @words = Set.new words
      @enumerator = @words.each
    end

    def add word
      @words << word
    end

    def next?
      @enumerator.peek
      true
    rescue StopIteration
      false
    end

    def next
      Word.new @enumerator.next
    end

    def == other
      @words == other.words
    end
    alias_method :eql?, :==

    def hash
      @words.hash
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