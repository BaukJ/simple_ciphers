class SimpleCiphers::CaesarCipher

  def initialize(offset, alphabet = SimpleCiphers::Alphabet::DEFAULT)
    @offset = offset
    @alphabet = alphabet
  end

  def encode(string)
    string.split('').map do |char|
      index = @alphabet.index_of char
      if index
        index += @offset
        index %= @alphabet.chars.length
        char.upcase == char ? @alphabet.chars[index].upcase : @alphabet.chars[index]
      else
        char
      end
    end.join('')
  end
end
