# frozen_string_literal: true

require_relative "almapi_spec_init"

RSpec.describe Almapi do
  it "has a version number" do
    expect(Almapi::VERSION).not_to be nil
  end
end

RSpec.describe Almapi::Api do

  the_api = Almapi::Api.new(APIKEY, URIBASE) 

  it "gives @apikey value" do
    expect(the_api.apikey).to eq(APIKEY)
  end

  it "gives @uri_base value" do
    expect(the_api.uri_base).to eq(URIBASE)
  end

  it "gets an invalid (error) response" do
    expect{ the_api.get("/items?item_barcode=a_non_existent_barcode") }.to raise_error(Almapi::AlmapiError)
  end

  it "gets an valid (success) response" do
    expect(the_api.get("/items?item_barcode=GED000011587").status).to eq(200)
  end  
end