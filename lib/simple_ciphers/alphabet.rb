# This class contains an array of the alphabet that will be used in the ciphers.
module SimpleCiphers
  class Alphabet
    attr_reader :chars, :case_sensitive

    def initialize(chars, case_sensitive = false)
      @chars = chars.to_a
      @case_sensitive = case_sensitive
      @chars.map!(&:downcase) unless case_sensitive
    end

    def include?(char)
      @chars.include?(char) ||
        (!@case_sensitive && @chars.include?(char.downcase))
    end

    def index_of(char)
      @chars.each_with_index do |c, i|
        if char == c || !@case_sensitive && char.downcase == c.downcase
          return i
        end
      end
      nil
    end

    ENGLISH_CASE_INSENSITIVE = SimpleCiphers::Alphabet.new 'a'..'z'
    ENGLISH_CASE_SENSITIVE   = Alphabet.new [*'A'..'Z', *'a'..'z'], true
    DEFAULT                  = ENGLISH_CASE_INSENSITIVE
  end
end
