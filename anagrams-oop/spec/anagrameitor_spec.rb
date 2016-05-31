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

    describe Anagrameitor::Word do
      it "#anagram?" do
        a_word = described_class.new "kinship"
        another_word = described_class.new "pinkish"
        expect(a_word.anagram? another_word).to be true

        yet_another_word = described_class.new "aaaaaaa"
        expect(a_word.anagram? yet_another_word).to be false
      end
    end
  end

end
