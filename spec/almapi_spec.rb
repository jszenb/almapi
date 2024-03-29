# frozen_string_literal: true

RSpec.describe Almapi do
  it "has a version number" do
    expect(Almapi::VERSION).not_to be nil
  end
end

RSpec.describe Almapi::Bonjour do
  it "says hi" do
    expect(Almapi::Bonjour.say_hi).to eq("Hello world!")
  end

  it "says bye" do
    expect(Almapi::Bonjour.say_bye).to eq("Bye world!")
  end
end