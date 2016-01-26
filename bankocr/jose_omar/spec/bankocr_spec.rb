require 'rspec'
require_relative '../bankocr.rb'

describe 'KataBankOCR' do
  let (:digit) {'   |_|  |'}
  let (:account){
  "    _  _     _  _  _  _  _ "<<
  "  | _| _||_||_ |_   ||_||_|"<<
  "  ||_  _|  | _||_|  ||_| _|"
  }
  let(:ocr) { Ocr.new() }

  it 'reads block number' do
    number = ocr.parse_digit(digit)
    expect(number).to eq(4)
  end

  it 'reads first digit' do
    digit = ocr.read_digit(account,0)
    expect(digit).to eq('     |  |')
    expect(ocr.parse_digit(digit)).to eq (1)
  end
  it 'read and parse all digits' do
    (0..8).to_a.each do |n|
    digit = ocr.read_digit(account,n)
    expect(ocr.parse_digit(digit)).to eq(n+1)
    end
  end

  it 'read account and create array' do
    account_vector = ocr.read_account(account)
    expect(account_vector).to eq((1..9).to_a)
  end

  it 'checksum' do
    account_vector = [3,4,5,8,8,2,8,6,5]
    expect(ocr.checksum(account_vector)).to eq(0)
  end

end

