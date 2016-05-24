class Anagrameitor
  class Anagrams
    def initialize
      @list = []
    end

    def include words
      return if words.empty?
      return if @list.include? words

      @list << words
    end

    def to_a
      @list.map(&:to_a)
    end
  end

  class Word
    include Comparable

    def initialize literal
      @literal = literal
    end

    def anagram? other
      (other.literal != @literal) && (other.literal.size == @literal.size)
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
      if anagram? the_word, candidate
        result.add candidate
        result.add the_word
      end
    end
    result
  end

  def self.anagram? candidate, word
    word.anagram? candidate
  end
end
