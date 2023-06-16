# frozen_string_literal: true

RSpec.describe SimpleCiphers::Alphabet do
  it "takes a list" do
    expect(SimpleCiphers::Alphabet.new []).not_to be nil
  end

  it "returns the list" do
    expect(SimpleCiphers::Alphabet.new("a".."z").chars[1]).to eql "b"
    expect(SimpleCiphers::Alphabet.new("a".."z").chars.length).to eql 26
  end

  context "English Case-Insensitive" do
    it "contais 26 chars" do
      expect(SimpleCiphers::Alphabet::ENGLISH_CASE_INSENSITIVE.chars.length).to eql 26
    end
  end

  context "English Case-Sensitive" do
    it "contais 52 chars" do
      expect(SimpleCiphers::Alphabet::ENGLISH_CASE_SENSITIVE.chars.length).to eql 52
    end
  end
end
