# frozen_string_literal: true

RSpec.describe SimpleCiphers::CaesarCipher do
  it "works with a 5 encoding" do
    cipher = SimpleCiphers::CaesarCipher.new 5
    expect(cipher.encode "Hello").to eql "Mjqqt"
  end
  it "works with a 25 encoding" do
    cipher = SimpleCiphers::CaesarCipher.new 25
    expect(cipher.encode "Hello").to eql "Gdkkn"
  end
  it "works with a -1 encoding" do
    cipher = SimpleCiphers::CaesarCipher.new -1
    expect(cipher.encode "Hello").to eql "Gdkkn"
  end
  it "works with a 0 encoding" do
    cipher = SimpleCiphers::CaesarCipher.new 0
    expect(cipher.encode "Hello World").to eql "Hello World"
  end
  it "works with letters and symbols" do
    cipher = SimpleCiphers::CaesarCipher.new 3
    expect(cipher.encode "Hello123! ##").to eql "Khoor123! ##"
  end
end
