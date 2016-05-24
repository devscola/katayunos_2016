class Anagrameitor
  class Anagrams
    def initialize
      @list = []
    end

    def add word
      @list << word
    end

    def include anagrams
      words = anagrams.to_a
      return if words.empty?
      return if @list.any?{ |w| (w - words).empty? }
      @list << words
    end

    def to_a
      @list
    end
  end

  class Words
    def initialize words
      @words = words
      @index = -1
    end

    def next?
      @index < @words.size - 1
    end

    def next
      @index += 1
      @words[@index]
    end

    def clone
      Words.new @words
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
    result = Anagrams.new
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
    (candidate != word) && (candidate.size == word.size)
  end
end
