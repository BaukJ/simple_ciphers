class SimpleCiphers::MonoalphabeticCipher
  attr_reader :words

  def initialize(word_list)
    @sentences = sentences
    @words = get_words_from_sentences @sentences
    @chars = get_chars_from_words @words
    @lower_words = lowercase_map @words
    @lower_chars = lowercase_map @chars
    @words = word_list.map(&:chomp).map(&:downcase).to_set
    @encoding = {
      "a" => "q",
      "b" => "l",
      "c" => "o",
      "d" => "t",
      "e" => "d",
      "f" => "p",
      "g" => "a",
      "h" => "g",
      "i" => "b",
      "j" => "u",
      "k" => "c",
      "l" => "s",
      "m" => "j",
      "n" => "z",
      "o" => "w",
      "p" => "f",
      "q" => "y",
      "r" => "r",
      "s" => "v",
      "t" => "e",
      "u" => "i",
      "v" =>  "x",
      "w" => "n",
      "x" => "m",
      "y" => "h",
      "z" => "k",
    }
  end

  def percent_valid_words
    puts
    valid_count = 0
    words = @words.keys
    puts
    words.each do |word|
      decoded = decode(word)
      if decoded =~ /^[0-9]*$/ || @valid_word_list.include?(decoded.downcase)
        valid_count += 1
      else
        puts "#{word} => #{decoded}"
      end
    end
    100 * valid_count / words.length.to_f
  end

  def decode(string)
    decoded = +""
    string.split('').each do |char|
      if @encoding.key? char.downcase
        decoded_char = @encoding[char.downcase].dup
        decoded_char.upcase! if char == char.upcase
        decoded << decoded_char
      else
        decoded << char
      end
    end
    decoded
  end

  private

  def get_words_from_sentences(sentences)
    words = {}
    sentences.each do |sentence|
      sentence.split.each do |word|
        word.gsub!(/[!.,]*$/, '')
        words[word] ||= 0
        words[word] += 1
      end
    end
    words
  end

  def get_chars_from_words(words)
    chars = {}
    words.each do |word, count|
      word.split('').each do |char|
        chars[char] ||= 0
        chars[char] += count
      end
    end
    chars
  end

  def lowercase_map(mixed_case_map)
    lowered_map = {}
    mixed_case_map.each do |key, count|
      lower_key = key.downcase
      lowered_map[lower_key] ||= 0
      lowered_map[lower_key] += count
    end
    lowered_map
  end
end
