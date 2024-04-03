# frozen_string_literal: true

require 'faraday'
require 'faraday/follow_redirects'
# Class Almapi handles Alma's API call
class Almapi::Api
  
  # Reads the key for API calls.
  #
  # @return [String] the API key
  attr_reader :apikey

  # Reads the URI base for API calls.
  #
  # @return [String] the URI base
  attr_reader :uri_base

  # Faraday object to handle API calls.
  #
  # @return [Object] the Faraday conn object
  attr_reader :conn

  # Initializes a new Almapi object and instance
  # variable @apikey, @uri_base and @conn
  # that is a Faraday connexion.
  #
  # @param apikey : API key to be used in API call
  # @param uri_base : base URI for API call
  def initialize(apikey, uri_base)
    @apikey = apikey
    @uri_base = uri_base
    @conn =
      Faraday.new do |f|
        f.response :follow_redirects
      end
  end

  # Handles a GET request creating the complete URI.
  # It handles the general case, the case of barcode use for items and
  # the case of analytics.
  # If analytics, handles the resumption_token and limit is set to 1000
  # which is the maximum.
  #
  # @param resource [String] mandatory : the part of the URI specifying the access point.
  #   <b>EXCEPT for analytics and barcode</b>, it must not include "?" for  it adds "?apikey" automatically.  
  #   If analytics, resource must include the report name.
  #   If barcode, resource must include the barcode value.
  # @param resumption_token [String] : resumption token for an analytics call.
  # @return [Response] : the resulting response
  def get(resource, resumption_token = "")
    url_api =
      if resource.include?("analytics") # API call to Analytics entry point
        "#{@uri_base}{resource}&limit=1000&apikey=#{@apikey}&#{resumption_token}"
      elsif resource.include?("barcode") # API call to items entry point with barcode
        "#{@uri_base}#{resource}&apikey=#{@apikey}"
      else
        "#{@uri_base}#{resource}?apikey=#{@apikey}" # All other cases
      end
    
      handle_response(@conn.get(url_api))

  end

  # Handles a POST request creating the complete URI. 
  #
  # @param resource [String] mandatory : the part of the URI specifying the access point.
  #    Must not include "?" for it adds "?apikey" automatically.
  # @param data [String] : an XML string containing data to post.
  # @return [Response] : the resulting response
  def post(resource, data)
    url_api = "#{resource}?apikey=#{@apikey}"
    handle_response(@conn.post(url_api, data.to_s, "Content-Type" => 'application/xml'))
  end

  # Handles a PUT request creating the complete URI.
  #
  # @param resource [String] mandatory : the part of the URI specifying the access point.
  #    Must not include "?" for it adds "?apikey" automatically.
  # @param data [String] : an XML string containing data to put. 
  # @return [Response] : the resulting response. If error occurs, raises an AlmapiError
  def put(resource, data)
    url_api = "#{resource}?apikey=#{@apikey}"
    handle_response(@conn.put(url_api, data.to_s, "Content-Type" => 'application/xml'))
  end

  # Handles a DELETE request creating the complete URI. 
  #
  # @param resource [String] mandatory : the part of the URI specifying the access point.
  #    Must not include "?" for it adds "?apikey" automatically.
  # @param data [String] : an XML string containing data to put.
  # @return [Response] : the resulting response. If error occurs, raises an AlmapiError
  def put(resource, data)
    url_api = "#{resource}?apikey=#{@apikey}"
    handle_response(@conn.put(url_api, data.to_s, "Content-Type" => 'application/xml'))
  end  

  private
    # [Private] handles the response and decides to raise AlmapiError if necessary
    #
    # @param response [Response] mandatory : the response of the API call
    # @return [Response || AlmapiError] : the resulting response if the API call succeeded, else AlmapiError
    def handle_response(response)
      case response.status
      when 200
        # Success
        return response
      else
        # Request has been correctly handled but cannot succeed
        raise Almapi::AlmapiError.new("AlmapiError : #{response.status} -> #{response.body}")
      end
    end
end
