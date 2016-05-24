module Anagrameitor
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
end