require 'rspec'

require_relative './lib'

describe "KatabankOCR" do
  it 'read the number one' do
    account = "   \n  |\n  |"
    expect(identify_account(account)).to eq(1)
  end

  it 'reads the number two' do
    account = " _ \n _|\n|_ "
    expect(identify_account(account)).to eq(2)
  end

  it 'reads the number three' do
    account = " _ \n _|\n _|"
    expect(identify_account(account)).to eq(3)
  end

  it 'reads the number four' do
    account = "   \n|_|\n  |"
    expect(identify_account(account)).to eq(4)
  end

  it 'reads the number five' do
    account = " _ \n|_ \n _|"
    expect(identify_account(account)).to eq(5)
  end

  it 'reads the number six' do
    account = " _ \n|_ \n|_|"
    expect(identify_account(account)).to eq(6)
  end

  it 'reads the number seven' do
    account = " _ \n  |\n  |"
    expect(identify_account(account)).to eq(7)
  end
end
