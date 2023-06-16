# frozen_string_literal: true

require_relative "simple_ciphers/version"
require_relative "simple_ciphers/alphabet"
require_relative "simple_ciphers/caesar_cipher"
require_relative "simple_ciphers/monoalphabetic_cipher"
require_relative "simple_ciphers/dictionary"

module SimpleCiphers
  class Error < StandardError; end
  # Your code goes here...
end
