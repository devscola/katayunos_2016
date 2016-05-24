require './anagrameitor'

RSpec.describe "Anagrameitor" do

  it "reports no anagrams" do
    word_list = %w(xavi batu gerard)
    result = Anagrameitor.anagrams_in word_list
    expect(result).to eq([])
  end

end