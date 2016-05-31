require './anagrameitor'

RSpec.describe "Anagrameitor" do

  context "Acceptance tests" do
    it "reports no anagrams" do
      word_list = %w(xaviuzz batu gerard)
      result = Anagrameitor.anagrams_in word_list
      expect(result).to eq([])
    end

    it "reports anagrams" do
      word_list = %w(ac b ca)
      result = Anagrameitor.anagrams_in word_list
      expect(result).to eq([['ac', 'ca']])
    end
  end

  context "Unit test" do

    describe Anagrameitor::AnagramUtil do
      it "#anagram?" do
        a_word = "kinship"
        another_word = "pinkish"
        expect(described_class.anagram? a_word, another_word).to be true

        yet_another_word = "aaaaaaa"
        expect(described_class.anagram? a_word, yet_another_word).to be false
      end
    end
  end

end
