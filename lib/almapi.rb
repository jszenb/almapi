# frozen_string_literal: true

require_relative "almapi/version"

module Almapi
  class Bonjour
    def self.say_hi
      "Hello world!"
    end

    def self.say_bye
      "Bye world!"
    end
  end
  class Error < StandardError; end
  # Your code goes here...
end
