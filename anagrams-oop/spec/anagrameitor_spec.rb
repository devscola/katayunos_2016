require './anagrameitor'

RSpec.describe "Anagrameitor" do

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